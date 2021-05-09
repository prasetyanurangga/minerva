
import 'package:minerva/models/word_response_model.dart';
import 'package:minerva/provider/response_data.dart';
import 'package:minerva/provider/api_provider.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class WordRepository{
  ApiProvider _apiProvider = ApiProvider();

  Future<ResponseData> getRandomWord() async{
  	Response response = await _apiProvider.getRandomWord();
  	WordResponseModel responseJust = WordResponseModel.fromJson(response.data);
  	if (responseJust == null) {
      return ResponseData.connectivityError();
    }

    if (response.statusCode == 200) {
      return ResponseData.success(responseJust.data);
    } else {
      return ResponseData.error("Error");
    }
  }
}