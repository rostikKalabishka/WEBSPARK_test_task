import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:webspark_test_task/repository/grid_repository/model/response_data_model.dart';

import 'grid.dart';
import 'model/send_result_model.dart';

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
  Future<void> sendData({required List<SendResultModel> res}) async {
    try {
      final resultList = res.map((e) => e.toJson()).toList();
      await dio.post(baseUrl, data: resultList).then((val) {
        print(val);
        log(val.statusCode.toString());
      });
    } catch (e) {
      rethrow;
    }
  }
}
