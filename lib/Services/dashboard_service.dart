import 'package:dio/dio.dart';

import '../core/network/dio_client.dart';
import '../data/model/transaction_model.dart';

class DashboardService {
  final DioClient _dioClient = DioClient();

  Future<List<TransactionModel>> getSummaryTransactions() async {
    try {
      Response response = await _dioClient.get("transactions");
      // print(response.data);
      // List data = response.data['products'];
      List data = response.data;
      // return response.data.map((e) => TransactionModel.fromJson(e)).toList();
      return data
          .map((e) => TransactionModel.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
