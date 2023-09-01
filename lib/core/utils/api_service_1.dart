import 'package:dio/dio.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class ApiService1 {
  bool test=false;
  final _baseUrl = 'http://fomoisreal-001-site9.btempurl.com/api/v1/';
  // final _baseUrl1 =  ;
  final Dio _dio;

  ApiService1(this._dio){
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      receiveDataWhenStatusError: true,
      // contentType:
      // "multipart/form-data; boundary=<calculated when request is sent>",
    );
  }

  Future<Map<String, dynamic>> get({required String endPoint,Map<String,dynamic>? parameters,String? token ,String? lang,}) async {
    _dio.options.headers={
      'Accept': APPLICATION_JSON,
      'Authorization': "Bearer $token",
      'Accept-Language': lang,
    };
    var response = await _dio.get(endPoint,queryParameters: parameters??{},);
    print("dio service${response.data}");
    print("dio service${response.statusCode}");
    if(response.data is! Map){
      print(response.data is! Map);
      print(response.data is! List);
      print(response.data is List);
      print(response.data);
      return {'data':response.data};
    }else {
      print('s');
      return response.data;
    }
  }

  Future<Response> post({required String endPoint,Map<String,dynamic>? data,Map<String,dynamic>? parameters,String? token}) async {
      _dio.options.headers={
        'Accept': 'application/json',
        // 'lang': lang,
        'Authorization': "Bearer $token",
      };
      print('>>>>>>>>><<<<<<<<<<<<445545454');
      var response = await _dio.post(endPoint,queryParameters:parameters,data: data??{},);
      // var response = await _dio.post(endPoint,data: FormData.fromMap(data??{}));
      print('>>>>>>>>><<<<<<<<<<<<1212121212');
      return response;

  }

  Future<Map<String, dynamic>> delete({required String endPoint,Map<String,dynamic>? data,Map<String,dynamic>? parameters,String? token}) async {

    _dio.options.headers={
      'Accept': APPLICATION_JSON,
      // 'lang': lang,
      'Authorization': "Bearer $token",
    };
    print('>>>>>>>>><<<<<<<<<<<<445545454');
    var response = await _dio.delete(endPoint,queryParameters:parameters,data: data??{},);
    // var response = await _dio.post(endPoint,data: FormData.fromMap(data??{}));
    print('>>>>>>>>><<<<<<<<<<<<1212121212');

    return response.data;

  }

  Future<Map<String, dynamic>> put({required String endPoint,Map<String,dynamic>? data,Map<String,dynamic>? parameters,String? token}) async {
    _dio.options.headers={
      'Accept': APPLICATION_JSON,
      // 'lang': lang,
      'Authorization': "Bearer $token",
    };
    var response = await _dio.put(endPoint,queryParameters:parameters,data: data??{},);
    // var response = await _dio.post(endPoint,data: FormData.fromMap(data??{}));

    return response.data;

  }

}

