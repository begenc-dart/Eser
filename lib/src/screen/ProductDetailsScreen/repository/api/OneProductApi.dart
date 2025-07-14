import 'dart:developer';

import 'package:eser/src/core/network/dio_helper.dart';
import 'package:eser/src/screen/ProductDetailsScreen/repository/data/OneProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Oneproductapi {
  var _dio = DioHelper.instance;
  Future<OneProductData> getProduct({required int product_id}) async {
    try {
      final response = await _dio.get(
        Apiurl.product + "/" + product_id.toString(),
        options: Options(extra: {'requiresAuthToken': true}),
      );

log(response.data.toString());
      if (response.statusCode == 200) {
        OneProductData model = OneProductData.fromJson(response.data);
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
