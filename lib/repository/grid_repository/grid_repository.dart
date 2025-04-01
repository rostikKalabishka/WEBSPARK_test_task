import 'package:dio/dio.dart';
import 'package:webspark_test_task/repository/grid_repository/model/coordinate_model.dart';
import 'package:webspark_test_task/repository/grid_repository/model/grid_data_model.dart';
import 'package:webspark_test_task/repository/grid_repository/model/response_data_model.dart';
import 'package:webspark_test_task/utils/helpers/algorithm/bfs.dart';

import 'grid.dart';

class GridRepository implements GridRepositoryInterface {
  final Dio dio = Dio();
  static const baseUrl = 'https://flutter.webspark.dev/flutter/api';

  @override
  Future<ResponseDataModel> getGridResponseData({required String url}) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = ResponseDataModel.fromJson(response.data);
        return responseData;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Incorrect URL for creating a get request');
    }
  }

  @override
  Future<void> sendData() async {
    try {} catch (e) {}
  }
}
