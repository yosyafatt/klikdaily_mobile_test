import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Response> getData({String endpoint = '/'}) async {
    try {
      final Response response = await dio.get(baseUrl + endpoint);
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }
}
