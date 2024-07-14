import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:task_management/controller/auth_controller.dart';
import 'package:task_management/data/newwork_response.dart';

class NetworkCaller {
  Future<NetworkResponse?> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      print(url);
      Response response = await post(
          Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'Application/json',
      });
      print(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: 200,
        );
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            jsonResponse: jsonDecode(response.body)
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> getRequest(String url) async{
    try{
      print(url);
      final Response response= await get(Uri.parse(url), headers: {
        'Conternt-type': 'Application/json',
        'token': AuthController.token.toString(),

      });
      print(response.headers.toString());
      print(response.statusCode.toString());
      print(response.body.toString());

      if(response.statusCode ==200){
        return NetworkResponse(
            isSuccess: true,
          jsonResponse: jsonDecode(response.body),
          statusCode: 200,
        );
      }else{
        return NetworkResponse(
            isSuccess: false,
          statusCode: response.statusCode
        );
      }
    }catch(e){
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString()
      );
    }
  }

  Future<void> backLogin() async{
    await AuthController.clearAuthData();

  }
}

