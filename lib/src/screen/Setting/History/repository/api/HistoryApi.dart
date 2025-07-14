import 'dart:developer';

import 'package:eser/src/screen/Setting/History/repository/data/HistoryData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Historyapi {
  final _dio = DioHelper.instance;
   Future<List<HistoryData>> getHistory() async {
    try {
      final response = await _dio.get(
        Apiurl.order,
        options: Options(extra: {'requiresAuthToken': true}),
      );
     
      if (response.statusCode == 200) {
        List product = response.data as List;
        List<HistoryData> model =
            product.map((e) => HistoryData.fromJson(e)).toList();
        return model;
      } else {
        
        throw Exception('Failed to fetch card: ${response.statusCode}');
      }
    } catch (e) {
   
      throw Exception('Failed to fetch card: $e');
    }
  }
}