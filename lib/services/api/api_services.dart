import 'package:dio/dio.dart';

class ApiServices {
  ///---------singleton pattern------------///
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();
  static ApiServices get instance => _instance;

  ///---------singleton pattern------------///

  final Dio _dio = Dio();

  getDio() => _dio;
}
