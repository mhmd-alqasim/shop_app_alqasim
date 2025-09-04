import 'package:alqasim_market/network/local/cache_helper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();
  static String get baseUrl => 'http://127.0.0.1/shopbackend/';

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final token = CacheHelper.getData('token');

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    final token = CacheHelper.getData('token');

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {'Content-Type': 'application/json'};
    return dio.put(url, queryParameters: query, data: data);
  }
}
