import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/repository/grid_repository/model/models.dart';

class ResponseDataModel extends Equatable {
  final bool error;
  final String message;
  final List<GridDataModel> data;

  const ResponseDataModel(
      {required this.error, required this.message, required this.data});

  @override
  List<Object?> get props => [error, message, data];

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((grid) => grid.toJson()).toList(),
    };
  }

  factory ResponseDataModel.fromJson(Map<String, dynamic> json) {
    return ResponseDataModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => GridDataModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
