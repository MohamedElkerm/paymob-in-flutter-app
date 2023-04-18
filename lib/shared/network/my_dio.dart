import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(

        baseUrl: 'https://accept.paymob.com/api/',
        receiveDataWhenStatusError: true,

        /// If you want to handle the headers HERE"
        // headers: {
        //   'Content-Type': 'application/json',
        //   'lang': 'ar',
        // },
      ),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query, lang, token}) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required url, query, required data, lang = 'en', token}) async {
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({required String url,required data}) async {
    return await dio.put(url,data: data);
  }

  static Future<Response> deleteData({required url,data})async{
    return dio.delete(url,data: data);
  }
}