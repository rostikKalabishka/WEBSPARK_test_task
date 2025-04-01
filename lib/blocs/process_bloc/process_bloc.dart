import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/blocs/process_bloc/process_state.dart';

import '../../repository/grid_repository/model/models.dart';
import '../../utils/helpers/algorithm/bfs.dart';

part 'process_event.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final PathFinder _pathFinder;

  ProcessBloc({required PathFinder pathFinder})
      : _pathFinder = pathFinder,
        super(const ProcessInitial()) {
    on<ProcessEvent>((event, emit) async {
      if (event is StartProcess) {
        await _startProcess(event, emit);
      }
    });
  }

  Future<void> _startProcess(
      StartProcess event, Emitter<ProcessState> emit) async {
    emit(const ProcessInProgress());
    final length = event.responseData.data.length;
    log('Кількість сіток: $length');
    List<SendResultModel> pathRes = [];

    for (int i = 0; i < length; i++) {
      try {
        log('Обробка сітки ${i + 1} з $length (ID: ${event.responseData.data[i].id})');

        final path = _pathFinder.findPath(
          event.responseData.data[i].field,
          event.responseData.data[i].start,
          event.responseData.data[i].end,
        );

        print(path);

        await Future.delayed(
          const Duration(milliseconds: 1500),
        );

        pathRes.add(
          SendResultModel(
            id: event.responseData.data[i].id,
            result: ResultModel(
              steps: path,
              path: path.join('->'),
            ),
          ),
        );

        double progressScore = ((i + 1) / length) * 100;
        print(progressScore);
        emit(ProcessProgressChanged(progressScore));
      } catch (e) {
        log('Помилка при обробці сітки ${event.responseData.data[i].id}: $e');
        pathRes.add(
          SendResultModel(
            id: event.responseData.data[i].id,
            result: const ResultModel(steps: [], path: ''),
          ),
        );
        double progressScore = ((i + 1) / length) * 100;
        print(progressScore);
        emit(ProcessProgressChanged(progressScore));
      }
    }
    emit(ProcessFinished(pathRes));
  }
}
