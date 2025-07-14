import 'dart:developer';

import 'package:eser/src/screen/auth/Login/repository/data/LoginData.dart';
import 'package:eser/src/utils/screen_export.dart';

class LoginApi {
final _dio = DioHelper.instance;

 
  Future<Map> login(Logindata data,) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.post(
        Apiurl.login,
        data: data.toJson(),
      );
       log(response.data.toString());
       log(response.statusCode.toString());
     
      if (response.statusCode == 200) {
        
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
}