part of 'response_data_bloc.dart';

sealed class ResponseDataState extends Equatable {
  const ResponseDataState();

  @override
  List<Object> get props => [];
}

final class ResponseDataInitial extends ResponseDataState {}

final class ResponseDataSuccess extends ResponseDataState {
  final ResponseDataModel responseData;

  const ResponseDataSuccess({required this.responseData});

  @override
  List<Object> get props => super.props..add(responseData);
}

final class ResponseDataLoading extends ResponseDataState {}

final class ResponseDataFailure extends ResponseDataState {
  final Object error;

  const ResponseDataFailure({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
