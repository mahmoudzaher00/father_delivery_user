import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://fomoisreal-001-site1.btempurl.com/api/v1/Account/',
        connectTimeout: const Duration(milliseconds: 50000),
        receiveTimeout:const Duration(milliseconds: 30000) ,
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 500;
          },
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'lang': lang,
      'Authorization': "Bearer $token",
    };

    return await dio!.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'lang': lang,
      'Authorization': "Bearer $token",
    };


    return dio!.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'lang': lang,
      'Authorization': "Bearer $token",
    };
    return dio!.put(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'lang': lang,
      'Authorization': "Bearer $token",
    };
    return dio!.delete(
      url!,
      queryParameters: query,
      data: data,
    );
  }
}