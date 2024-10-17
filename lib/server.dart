import 'package:dio/dio.dart';
import 'package:f3_project_1/main.dart';

class Server {
  final dio = Dio();

  headers(){
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    };

    return header;
  }

  headersWithToken(){
    var token = box.read('token');
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Athorization": token
    };

    return header;
  }

  getRequest({required String endPoint, Map<String, dynamic>? body}) async {
    try{
      var response = await dio.get(endPoint,options: Options(
        headers: headers(), 
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: body
      );
      return response;
    }catch(e)
    {
      return e;
    }
  }

  getRequestWithToken({required String endPoint, Map<String, dynamic>? body}) async {
    try{
      var response = await dio.get(endPoint,options: Options(
        headers: headersWithToken(), 
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: body
      );
      return response;
    }catch(e)
    {
      return e;
    }
  }

  postRequest({required String endPoint, Map<String, dynamic>? body}) async {
    try{
      var response = await dio.get(endPoint,options: Options(
        headers: headers(), 
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: body
      );
      return response;
    }catch(e)
    {
      return e;
    }
  }

  postRequestWithToken({required String endPoint, Map<String, dynamic>? body}) async {
    try{
      var response = await dio.get(endPoint,options: Options(
        headers: headersWithToken(), 
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: body
      );
      return response;
    }catch(e)
    {
      return e;
    }
  }
}