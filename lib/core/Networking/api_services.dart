import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;
  final _baseUrl = 'https://yogahez.mountasher.online/api';
  // ApiServices(this.dio);
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://yogahez.mountasher.online/api',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map<String, dynamic>> getData(
      {required String endPoint,
      Map<String, dynamic>? query,
      String lang = 'en'}) async {
    dio.options.headers = {
      'lang': lang,
    };
    var response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
    return response.data;
  }
}
