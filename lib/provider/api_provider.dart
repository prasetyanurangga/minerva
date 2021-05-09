import 'package:dio/dio.dart';
import 'dart:async';


class ApiProvider{
  final Dio _dio = Dio();

  Future<Response> getRandomWord() async {
    String _endpoint = "";
    Response response;
    try {
      response = await _dio.post(_endpoint);
      print(response);
    } on Error catch (e) {
      throw Exception('Failed to load post ' + e.toString());
    }
    return response;
  }
}