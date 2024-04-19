import 'package:dio/dio.dart';

const String baseUrl = 'https://api.weatherapi.com/v1';
final String apiKey = '77cc03eeb9e7499a947140157230111';

class ApiService {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
}

// ignore: camel_case_types
class GetData {
  static Future<Response> getData(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    var response = await ApiService.dio.get(
      path,
      queryParameters: queryParameters,
    );
    return response;
  }
}
