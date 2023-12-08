import 'package:dio/dio.dart';

abstract class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://yogahez.mountasher.online/api',
          receiveDataWhenStatusError: true,
          headers: {'Accept': 'application/json'}),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }
}
