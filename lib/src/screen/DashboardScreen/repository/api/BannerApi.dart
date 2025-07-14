import 'package:eser/src/screen/DashboardScreen/repository/data/BannerData.dart';
import 'package:eser/src/utils/screen_export.dart';

class Bannerapi {
  final _dio = DioHelper.instance;

  Future<List<BannerData>> getBanner() async {
    try {
      final response = await _dio.get(
        Apiurl.banner,
        options: Options(extra: {'requiresAuthToken': true}),
      );
     
      if (response.statusCode == 200) {
        List categories = response.data;
        List<BannerData> model =
            categories.map((e) => BannerData.fromJson(e)).toList();
        return model;
      } else {
       
        throw Exception("Failed to post Credit card ${response.statusCode}");
      }
    } catch (e) {
     
      throw Exception(e);
    }
  }
}