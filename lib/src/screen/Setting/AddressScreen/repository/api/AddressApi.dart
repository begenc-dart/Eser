import 'dart:developer';

import 'package:eser/src/screen/Setting/AddressScreen/repository/data/AddressGetData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Addressapi {
    final _dio = DioHelper.instance;

 
  Future<Map> postAddress(AddressPostData data,) async {
    try {
      log(data.toString());
      final response = await _dio.post(
        Apiurl.location,
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
    Future<List<AddressGetData>> getAddress() async {
    try {
      final response = await _dio.get(
        Apiurl.location,
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        List product = response.data as List;
        List<AddressGetData> model =
            product.map((e) => AddressGetData.fromJson(e)).toList();
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
  Future<Map> deleteLocation(String id) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.delete(
        Apiurl.location+"/"+id,
       
        
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
  Future<Map> putAddress(AddressPostData data,String locationId) async {
    try {
      log(data.toString());
      final response = await _dio.put(
        Apiurl.location+"/"+locationId,
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