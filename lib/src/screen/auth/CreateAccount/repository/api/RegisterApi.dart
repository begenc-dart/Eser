import 'dart:developer';

import 'package:eser/src/screen/auth/CreateAccount/repository/data/RegisterData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Registerapi {
final _dio = DioHelper.instance;

 
  Future<Map> register(RegisterData data,) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.post(
        Apiurl.register,
        data: data.toJson(),
      );
       log(response.data.toString());
       log(response.statusCode.toString());
     
      if (response.statusCode == 200) {
        
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
}