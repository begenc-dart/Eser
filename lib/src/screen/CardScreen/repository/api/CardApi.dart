
import 'dart:developer';

import 'package:eser/src/screen/CardScreen/repository/data/CardAddData.dart';
import 'package:eser/src/screen/CardScreen/repository/data/card_get_data.dart';
import 'package:eser/src/utils/screen_export.dart';

class CardApi {
  final _dio = DioHelper.instance;

 
  Future<Map> card(CardDataPost data,) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.post(
        Apiurl.card,
        data: data.toJson(),
        
        options: Options(extra: {'requiresAuthToken': true}),
      );
      if (response.statusCode == 200) {
        // log("log printed");
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
  Future<List<CardGetData>> getCard() async {
    try {
      final response = await _dio.get(
        Apiurl.card,
        options: Options(extra: {'requiresAuthToken': true}),
      );
      if (response.statusCode == 200) {
        List product = response.data as List;
        List<CardGetData> model =
            product.map((e) => CardGetData.fromJson(e)).toList();
        return model;
      } else {
        log(response.statusCode.toString());
        throw Exception('Failed to fetch card: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch card: $e');
    }
  }
    Future<Map> deleteCardProduct(String id) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.delete(
        Apiurl.cardDelete+id,
       
        
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        // log("log printed");
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
     Future<Map> deleteCard(String id) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.delete(
        Apiurl.card+"/"+id,
       
        
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        // log("log printed");
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
    Future<Map> cardUpdate(CardPutData data,) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      log(data.toString());
      final response = await _dio.put(
        Apiurl.card+"/"+data.sized_id.toString(),
        data: data.toJson(),
        
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        // log("log printed");
      } else {
        throw Exception();
      }
      return response.data;
    } catch (e) {
      
      throw Exception(e);
    }
  }
}
