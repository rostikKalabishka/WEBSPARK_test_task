import 'package:flutter/material.dart';
import 'package:webspark_test_task/app.dart';
import 'package:webspark_test_task/utils/helpers/algorithm/bfs.dart';

import 'repository/grid_repository/model/models.dart';

ResponseDataModel response = ResponseDataModel(
  error: false,
  message: "OK",
  data: [
    GridDataModel(
      id: "7d785c38-cd54-4a98-ab57-44e50ae646c1",
      field: [
        ['.', 'X', '.'],
        ['.', 'X', '.'],
        ['.', '.', '.']
      ],
      start: CoordinateModel(x: 2, y: 0),
      end: CoordinateModel(x: 1, y: 2),
    ),
    GridDataModel(
      id: "88746d24-bf68-4dea-a6b6-4a8fefb47eb9",
      field: [
        ['X', 'X', 'X', '.'],
        ['X', '.', '.', 'X'],
        ['X', '.', '.', 'X'],
        ['.', 'X', 'X', 'X']
      ],
      start: CoordinateModel(x: 0, y: 3),
      end: CoordinateModel(x: 3, y: 0),
    ),
  ],
);

void main() {
  runApp(const MyApp());

  print(PathFinder().findPath(
      response.data[0].field, response.data[0].start, response.data[0].end));
}
