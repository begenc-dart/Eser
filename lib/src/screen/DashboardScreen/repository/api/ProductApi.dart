import 'dart:developer';

import 'package:eser/src/utils/screen_export.dart';

class ProductApi {
  final _dio = DioHelper.instance;

  Future<List<ProductData>> getProduct({
    required int page,
    required String url,
    int limit = 10,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(extra: {'requiresAuthToken': true}),
      );

      if (response.statusCode == 200) {
        List product = response.data as List;
        List<ProductData> model =
            product.map((e) => ProductData.fromJson(e)).toList();
        return model;
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}
