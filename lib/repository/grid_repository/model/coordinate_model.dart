import 'package:equatable/equatable.dart';

class CoordinateModel extends Equatable {
  final int x;
  final int y;

  const CoordinateModel({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      x: json['x'] as int,
      y: json['y'] as int,
    );
  }
}
