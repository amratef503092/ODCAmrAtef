import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'end_point.dart';

class DioHelper {
  static late Dio dio;
  DioHelper(String api){
    dio = Dio();
    dio.options.receiveDataWhenStatusError = true;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.options.baseUrl =api;
  }
  static Future<Response?> postData(
      {String ?endPoint, Map <String,dynamic>?dataPost, String token = ''}) async {

    try{
      Response response = await dio.post(
        KEY+endPoint!,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer  $token',
          },

        ),
        data: dataPost
    );
      return response;
    }on DioError catch(e){
      return e.response;
    }


  }
  static Future<Response?> getData(
      {String ?code, Map <String,dynamic>?query, String token = ''}) async {
    try{
    Response response = await dio.get(
        KEY+code!,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer  $token',
          },

        ),
        queryParameters: query
    );
    return response;
  }on DioError catch(e)
    {
      return e.response;
    }
  }




}