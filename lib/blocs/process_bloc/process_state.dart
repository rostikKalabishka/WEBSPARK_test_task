import 'package:equatable/equatable.dart';

import '../../repository/grid_repository/model/models.dart';

abstract class ProcessState extends Equatable {
  final double progress;

  const ProcessState({this.progress = 0.0});

  @override
  List<Object?> get props => [progress];
}

class ProcessInitial extends ProcessState {
  const ProcessInitial() : super(progress: 0.0);
}

class ProcessInProgress extends ProcessState {
  const ProcessInProgress() : super(progress: 0.0);
}

class ProcessProgressChanged extends ProcessState {
  const ProcessProgressChanged(double progress) : super(progress: progress);

  @override
  List<Object?> get props => [progress];
}

class ProcessFinished extends ProcessState {
  final List<SendResultModel> pathResults;

  const ProcessFinished(this.pathResults) : super(progress: 100.0);

  @override
  List<Object?> get props => [pathResults, progress];
}

class ProcessFailure extends ProcessState {
  final String error;

  const ProcessFailure(this.error) : super(progress: 0.0);

  @override
  List<Object?> get props => [error, progress];
}
