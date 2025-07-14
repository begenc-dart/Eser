import 'dart:developer';

import 'package:eser/src/screen/Shopping/repository/data/MarketProductData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Marketproductapi {
  final _dio = DioHelper.instance;
   Future<MarketProductData> getProduct({
    required int page,
    required int market_id,
    int limit = 10,
  }) async {
    try {
     
      final response = await _dio.get(
        Apiurl.market+"/${market_id}"+"?page=${page}&limit=${limit}",
        options: Options(extra: {'requiresAuthToken': true}),
      );
     
    log(response.data.toString())
;
      if (response.statusCode == 200) {

        MarketProductData model =MarketProductData.fromJson(response.data);
        return model;
      } else {
        log(response.data);
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
     throw Exception('Failed to fetch products: $e');
    }
  }
}