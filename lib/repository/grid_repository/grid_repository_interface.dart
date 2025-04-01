import 'model/models.dart';

abstract interface class GridRepositoryInterface {
  Future<ResponseDataModel> getGridResponseData({required String url});
  Future<void> sendData({required List<SendResultModel> res});
}
