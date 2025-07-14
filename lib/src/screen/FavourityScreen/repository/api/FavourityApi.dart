
import 'package:eser/src/screen/FavourityScreen/repository/data/FavourityData.dart';
import 'package:eser/src/utils/screen_export.dart';

class FavourityApi {
  final _dio = DioHelper.instance;

 
  Future<Map> favourity(FavourityData data,) async {
    try {
      // log(sign.first_name.toString()+sign.last_name);
      final response = await _dio.post(
        Apiurl.favourity,
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
  Future<List<ProductData>> getFavourityProduct() async {
    try {
      final response = await _dio.get(
        Apiurl.favourity+"?limit=100",
        options: Options(extra: {'requiresAuthToken': true}),
      );
     
      if (response.statusCode == 200) {
        List categories = response.data;
        List<ProductData> model =
            categories.map((e) => ProductData.fromJson(e)).toList();
        return model;
      } else {
       
        throw Exception("Failed to post Credit card ${response.statusCode}");
      }
    } catch (e) {
     
      throw Exception(e);
    }
  }
}
