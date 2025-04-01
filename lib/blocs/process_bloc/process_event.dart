part of 'process_bloc.dart';

sealed class ProcessEvent extends Equatable {
  const ProcessEvent();

  @override
  List<Object> get props => [];
}

class StartProcess extends ProcessEvent {
  final ResponseDataModel responseData;

  const StartProcess(this.responseData);

  @override
  List<Object> get props => super.props..add(responseData);
}
