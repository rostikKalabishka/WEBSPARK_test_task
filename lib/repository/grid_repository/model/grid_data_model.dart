import 'package:equatable/equatable.dart';

import 'models.dart';

class GridDataModel extends Equatable {
  final String id;
  final List<List<String>> field;
  final CoordinateModel start;
  final CoordinateModel end;

  const GridDataModel({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [id, field, start, end];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'field': field,
      'start': start.toJson(),
      'end': end.toJson(),
    };
  }

  factory GridDataModel.fromJson(Map<String, dynamic> json) {
    return GridDataModel(
      id: json['id'] as String,
      field: (json['field'] as List)
          .map((row) => row is List
              ? row.map((cell) => cell.toString()).toList()
              : <String>[row.toString()])
          .toList(),
      start: CoordinateModel.fromJson(json['start'] as Map<String, dynamic>),
      end: CoordinateModel.fromJson(json['end'] as Map<String, dynamic>),
    );
  }
}
