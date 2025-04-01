part of 'response_data_bloc.dart';

sealed class ResponseDataEvent extends Equatable {
  const ResponseDataEvent();

  @override
  List<Object> get props => [];
}

class GetUrl extends ResponseDataEvent {
  final String url;

  const GetUrl({required this.url});

  @override
  List<Object> get props => super.props..add(url);
}
