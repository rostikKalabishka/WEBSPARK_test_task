import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/grid_repository/grid.dart';
import '../../repository/grid_repository/model/models.dart';

part 'send_result_event.dart';
part 'send_result_state.dart';

class SendResultBloc extends Bloc<SendResultEvent, SendResultState> {
  final GridRepositoryInterface _gridRepository;
  SendResultBloc({required GridRepositoryInterface gridRepository})
      : _gridRepository = gridRepository,
        super(SendResultInitial()) {
    on<SendResultEvent>((event, emit) async {
      if (event is SendResultDataEvent) {
        await _sendResultData(event, emit);
      }
    });
  }

  Future<void> _sendResultData(SendResultDataEvent event, emit) async {
    emit(SendResultLoading());
    try {
      await _gridRepository.sendData(res: event.results);
      emit(SendResultSuccess());
    } catch (e) {
      emit(SendResultFailure(error: e));
    }
  }
}
