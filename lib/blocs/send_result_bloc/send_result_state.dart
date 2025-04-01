part of 'send_result_bloc.dart';

sealed class SendResultState extends Equatable {
  const SendResultState();

  @override
  List<Object> get props => [];
}

final class SendResultInitial extends SendResultState {}

final class SendResultLoading extends SendResultState {}

final class SendResultSuccess extends SendResultState {}

final class SendResultFailure extends SendResultState {
  final Object error;

  const SendResultFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
