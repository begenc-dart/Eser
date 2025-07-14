import 'dart:developer';

import 'package:eser/src/screen/Setting/ProfileScreen/repository/data/ProfileData.dart';
import 'package:eser/src/utils/screen_export.dart';

class ProfileApi {
  var _dio = DioHelper.instance;
  Future<ProfileData> getProfile() async {
    try {
      final response = await _dio.get(
        Apiurl.profile ,
        options: Options(extra: {'requiresAuthToken': true}),
      );

      log(response.data.toString());
      if (response.statusCode == 200) {
        ProfileData model = ProfileData.fromJson(response.data);
        return model;
      } else {
        log(response.statusCode.toString());
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch products: $e');
    }
  }
}