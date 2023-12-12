import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  final _baseUrl = 'https://yogahez.mountasher.online/api';
  ApiServices(this.dio);

  Future<Map<String, dynamic>> getData(
      {required String endPoint,
      Map<String, dynamic>? query,
      String lang = 'en'}) async {
    dio.options.headers = {'lang': lang};
    var response = await dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
      queryParameters: query,
      data: data,
    );
    return response.data;
  }
}
