import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/repository/grid_repository/grid.dart';
import 'package:webspark_test_task/repository/grid_repository/model/models.dart';

part 'response_data_event.dart';
part 'response_data_state.dart';

class ResponseDataBloc extends Bloc<ResponseDataEvent, ResponseDataState> {
  final GridRepositoryInterface _gridRepository;
  ResponseDataBloc({required GridRepositoryInterface gridRepository})
      : _gridRepository = gridRepository,
        super(ResponseDataInitial()) {
    on<ResponseDataEvent>((event, emit) async {
      if (event is GetUrl) {
        await _getResponseData(event, emit);
      }
    });
  }
  Future<void> _getResponseData(GetUrl event, emit) async {
    emit(ResponseDataLoading());
    try {
      final ResponseDataModel responseData =
          await _gridRepository.getGridResponseData(url: event.url);

      emit(ResponseDataSuccess(responseData: responseData));
    } catch (e) {
      emit(ResponseDataFailure(error: e));
    }
  }
}
