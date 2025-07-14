

import 'dart:developer';

import 'package:eser/src/screen/CategoriesScreen/repository/data/CategoryData.dart';
import 'package:eser/src/screen/CategoriesScreen/repository/data/MarketData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Marketapi {
  final _dio = DioHelper.instance;

  Future<List<MarketData>> getMarket(String url) async {
    try {
      final response = await _dio.get(
        Apiurl.market+url,
        options: Options(extra: {'requiresAuthToken': true}),
      );
     
      if (response.statusCode == 200) {
        List categories = response.data;
        List<MarketData> model =
            categories.map((e) => MarketData.fromJson(e)).toList();
        return model;
      } else {
       
        throw Exception("Failed to post Credit card ${response.statusCode}");
      }
    } catch (e) {
     
      throw Exception(e);
    }
  }
    Future<List<CategoryData>> getCategory({
    required int page,
 
    int limit = 10,
  }) async {
    try {
     
      final response = await _dio.get(
        Apiurl.category+"?page=${page}&limit=${limit}",
        options: Options(extra: {'requiresAuthToken': true}),
      );
     

      if (response.statusCode == 200) {
        List product = response.data as List;
        List<CategoryData> model =
            product.map((e) => CategoryData.fromJson(e)).toList();
        return model;
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
     throw Exception('Failed to fetch products: $e');
    }
  }
}
