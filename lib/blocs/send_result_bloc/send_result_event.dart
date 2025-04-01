part of 'send_result_bloc.dart';

sealed class SendResultEvent extends Equatable {
  const SendResultEvent();

  @override
  List<Object> get props => [];
}

class SendResultDataEvent extends SendResultEvent {
  final List<SendResultModel> results;

  const SendResultDataEvent(this.results);

  @override
  List<Object> get props => super.props..add(results);
}
