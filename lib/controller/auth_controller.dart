import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/data/model/user_model.dart';

class AuthController{
  static String? token;
  static UserModel? user;
  static Future<void> saveUserInformation(String t, UserModel model) async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString('token', t);
    sharedPreferences.setString('user', jsonEncode(model.toString()));
    token=t;
    user=model;
  }
  static Future<void> initializedUserCache() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    token= sharedPreferences.getString('token');
    user= UserModel.fromJson(jsonDecode(sharedPreferences.getString('user') ?? ""));

  }

  static Future<bool> checkAuthStatus() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    String? token= sharedPreferences.getString('token');
    if(token!=null){
      await initializedUserCache();
      return true;
    }
    return false;
  }
  static Future<void> clearAuthData() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}