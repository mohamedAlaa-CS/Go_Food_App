import 'package:dio/dio.dart';

abstract class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  postData({
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
