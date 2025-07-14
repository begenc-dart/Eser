import 'dart:developer';

import 'package:eser/src/screen/OrderScreen/repository/data/OrderData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Orderapi {
   final _dio = DioHelper.instance;
  
  Future<Map> postOrder(OrderData data,int cart_order_id) async {
    try {
      log(data.toString());
      log(cart_order_id.toString());
      final response = await _dio.post(
        Apiurl.card+"/"+cart_order_id.toString()+"/order",
        data: data.toJson(),
        
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
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