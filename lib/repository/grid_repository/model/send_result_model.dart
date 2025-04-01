import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/repository/grid_repository/model/models.dart';

class SendResultModel extends Equatable {
  final String id;
  final ResultModel result;

  const SendResultModel({required this.id, required this.result});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': result.toJson(),
    };
  }

  factory SendResultModel.fromJson(Map<String, dynamic> json) {
    return SendResultModel(
      id: json['id'] as String,
      result: ResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [id, result];
}
