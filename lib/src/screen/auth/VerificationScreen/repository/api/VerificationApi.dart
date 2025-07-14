
import 'dart:developer';

import 'package:eser/src/screen/auth/VerificationScreen/repository/data/VerificationData.dart';
import 'package:eser/src/utils/screen_export.dart';

class VerificationApi {
  final _dio = DioHelper.instance;

 
  Future<Map> verification(VerificationData data,
      void Function(String key, String newToken) updateTokenCallback) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.post(
        Apiurl.verify,
        data: data.toJson(),
      );
      
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        updateTokenCallback("token", response.data['token'].toString());
       log("token yazyldy");
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
}
