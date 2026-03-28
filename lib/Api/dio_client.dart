import 'package:dio/dio.dart';


class DioClient {
  static final DioClient _instance = DioClient();
  late Dio dio;

  factory DioClient(){
    return _instance;
  }

  DioClient._internal(){
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type" : "application/json"
        }
      ),
    );
    _initiallInterceptors();
  }

  void _initiallInterceptors(){
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("REQUEST[${options.method}] => PATH : ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("RESPONSE[${response.statusCode}] => PATH : ${response.data}");
          return handler.next(response);
        },
        onError: (error, handler) {
          print("ERROR[${error.error}] => PATH : ${error.message}");
          return handler.next(error);
        }
      )
    );
    Future<Response> get (String url, {Map<String, dynamic>? queryParams}) async {
      return await dio.get(url, queryParameters: queryParams);
    }
  }
}