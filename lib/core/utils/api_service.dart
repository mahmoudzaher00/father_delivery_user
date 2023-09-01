
import 'package:dio/dio.dart';

import '../errors/failures.dart';
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class ApiService {
  final _baseUrl = 'http://fomoisreal-001-site1.btempurl.com/api/v1/';
  final Dio _dio;

  ApiService(this._dio){
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      receiveDataWhenStatusError: true,
      // contentType:
      // "multipart/form-data; boundary=<calculated when request is sent>",
    );
  }
  // Future<MyResponse> get({required String endPoint,Map<String,dynamic>? parameters, String? token,String?lang,String? keyOfMessage }) async {
  //   try{
  //     _dio.options.headers={
  //       'Accept': APPLICATION_JSON,
  //       'lang': lang,
  //       'Authorization': "Bearer $token",
  //     };
  //     var response = await _dio.get(endPoint,queryParameters: parameters??{});
  //
  //     return MyResponse(msg: keyOfMessage==null?'Success':response.data[keyOfMessage],isSuccess: true,response: response,statusCode: response.statusCode);
  //
  //   }on Exception catch (ex){
  //     if(ex is DioError) {
  //
  //       return MyResponse(msg: ServerFailure.fromDioError(ex).errMessage,isSuccess: false);
  //     }else{
  //       return MyResponse(msg: ServerFailure(ex.toString()).errMessage,isSuccess: false);
  //
  //     }
  //   }
  //
  // }

  Future<Map<String, dynamic>> get({required String endPoint,Map<String,dynamic>? parameters,String? token ,String? lang,}) async {
    _dio.options.headers={
      'Accept': APPLICATION_JSON,
      'Authorization': "Bearer $token",
      'Accept-Language': lang,
    };

    var response = await _dio.get(endPoint,queryParameters: parameters??{},);
    return response.data;
  }


  Future<MyResponse> post({required String endPoint,Map<String,dynamic>? data,Map<String,dynamic>? parameters,String? token}) async {
    try{
      _dio.options.headers={
        'Accept': 'application/json',
        // 'lang': lang,
        'Authorization': "Bearer $token",
      };
      print('>>>>>>>>><<<<<<<<<<<<445545454');
      var response = await _dio.post(endPoint,queryParameters:parameters,data: data??{},);
      // var response = await _dio.post(endPoint,data: FormData.fromMap(data??{}));
      print('>>>>>>>>><<<<<<<<<<<<1212121212');
      return MyResponse(msg: "success",isSuccess: true,response: response,statusCode: response.statusCode);

    }on Exception catch (ex){

      print('>>>>>>><<<<<<<<<<<<<<eeeee');

      if(ex is DioError) {
        print(ex.error.toString());
        print(ex.message);

        return MyResponse(msg: ServerFailure.fromDioError(ex).errMessage,isSuccess: false,);
      }else{
        return MyResponse(msg: ServerFailure(ex.toString()).errMessage,isSuccess: false);

      }
    }

  }

  Future<Map<String, dynamic>> post1({required String endPoint,Map<String,dynamic>? data,Map<String,dynamic>? parameters,String? token}) async {
      _dio.options.headers={
        'Accept': 'application/json',
        // 'lang': lang,
        'Authorization': "Bearer $token",
      };

      var response = await _dio.post(endPoint,queryParameters:parameters,data: data??{},);
      print('>>>>>>>>><<<<<<<<<<<<445545454$response');
      // var response = await _dio.post(endPoint,data: FormData.fromMap(data??{}));
      return response.data ;


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
class MyResponse {
  final String msg;
  final bool isSuccess;
  final Response? response;
  final int? statusCode;

  MyResponse( {required this.msg,required this.isSuccess, this.response,this.statusCode,});
}
