import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/repository/grid_repository/model/coordinate_model.dart';

class ResultModel extends Equatable {
  final List<CoordinateModel> steps;
  final String path;

  const ResultModel({required this.steps, required this.path});
  @override
  List<Object?> get props => [steps, path];

  Map<String, dynamic> toJson() {
    return {
      'steps': steps.map((coordinate) => coordinate.toJson()).toList(),
      'path': path,
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      steps: (json['steps'] as List<dynamic>)
          .map((item) => CoordinateModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
    );
  }
}
