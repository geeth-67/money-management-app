import 'package:banking_app/Api/dio_client.dart';
import 'package:dio/dio.dart';


class DashboardService {
  final DioClient _dioClient = DioClient();

  Future<List<dynamic>> getSummaryTransaction() async {
    try {
      Response response = await _dioClient.get("products");
      
      if (response.statusCode == 200) {
        return response.data["products"] ?? [];
      } else {
        throw Exception("Failed to load transactions. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("API Error: $e");
      throw Exception("Error fetching data");
    }
  }
}