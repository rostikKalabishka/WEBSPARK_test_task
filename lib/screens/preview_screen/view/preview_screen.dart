import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/response_data_bloc/response_data_bloc.dart';
import 'package:webspark_test_task/repository/grid_repository/model/models.dart';
import 'package:webspark_test_task/ui/theme/app_const.dart';

@RoutePage()
class PreviewScreen extends StatefulWidget {
  const PreviewScreen({
    super.key,
    required this.resultModel,
    required this.index,
  });

  final ResultModel resultModel;
  final int index;

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late final GridDataModel gridData;

  @override
  void initState() {
    gridData = (context.read<ResponseDataBloc>().state as ResponseDataSuccess)
        .responseData
        .data[widget.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int rowCount = gridData.field.length;
    final int colCount =
        gridData.field.isNotEmpty ? gridData.field[0].length : 0;
    Color cellColor = Colors.white;

    return Scaffold(
      appBar: AppBar(title: const Text('Preview Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: colCount,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1,
                ),
                itemCount: rowCount * colCount,
                itemBuilder: (context, index) {
                  final int row = index ~/ colCount;
                  final int col = index % colCount;
                  final String cellValue = gridData.field[row][col];

                  final isInPath = widget.resultModel.steps
                      .any((coord) => coord.x == row && coord.y == col);

                  cellColor = gridChangingColor(
                      row, col, cellColor, cellValue, isInPath);

                  return Container(
                    color: cellColor,
                    child: Center(
                      child: Text(
                        '($row,$col)',
                        style: TextStyle(
                          color: cellColor == AppConst.blockedPoint
                              ? Colors.white
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.resultModel.path,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color gridChangingColor(
      int row, int col, Color cellColor, String cellValue, bool isInPath) {
    if (row == gridData.start.x && col == gridData.start.y) {
      cellColor = AppConst.startPoint;
    } else if (row == gridData.end.x && col == gridData.end.y) {
      cellColor = AppConst.endPoint;
    } else if (cellValue == "X") {
      cellColor = AppConst.blockedPoint;
    } else if (isInPath) {
      cellColor = AppConst.shortestPath;
    } else {
      cellColor = AppConst.emptyPoint;
    }
    return cellColor;
  }
}
