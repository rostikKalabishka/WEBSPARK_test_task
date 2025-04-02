import 'dart:collection';

import '../../repository/grid_repository/model/models.dart';

const List<List<CoordinateModel>> directions = [
  [
    // вправо
    CoordinateModel(x: 1, y: 0),
    // вліво
    CoordinateModel(x: -1, y: 0),
  ],
  [
    // вниз
    CoordinateModel(x: 0, y: 1),

    // вгору
    CoordinateModel(x: 0, y: -1),
  ],
  [
    // діагональ вниз-вправо
    CoordinateModel(x: 1, y: 1),
    // діагональ вгору-вліво
    CoordinateModel(x: -1, y: -1),
  ],
  [
    // діагональ вгору-вправо
    CoordinateModel(x: 1, y: -1),
    // діагональ вниз-вліво
    CoordinateModel(x: -1, y: 1),
  ],
];

class PathFinder {
  // Функція BFS для пошуку найкоротшого шляху між двома точками
  List<CoordinateModel> findPath(
      List<List<String>> grid, CoordinateModel start, CoordinateModel end) {
    int n = grid.length;

    Queue<List<CoordinateModel>> queue = Queue();
    queue.add([start]);
    Set<CoordinateModel> visited = {start};

    while (queue.isNotEmpty) {
      List<CoordinateModel> path = queue.removeFirst();
      CoordinateModel current = path.last;

      if (current == end) {
        return path;
      }

      for (List<CoordinateModel> dir in directions) {
        for (CoordinateModel d in dir) {
          CoordinateModel next = CoordinateModel(
            x: current.x + d.x,
            y: current.y + d.y,
          );
          if (next.x >= 0 &&
              next.x < n &&
              next.y >= 0 &&
              next.y < n &&
              grid[next.x][next.y] != 'X' &&
              !visited.contains(next)) {
            visited.add(next);
            List<CoordinateModel> newPath = List.from(path);
            newPath.add(next);
            queue.add(newPath);
          }
        }
      }
    }
    return [];
  }
}
