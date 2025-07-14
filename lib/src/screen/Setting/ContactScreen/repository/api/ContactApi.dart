import 'dart:developer';

import 'package:eser/src/core/Exception.dart';
import 'package:eser/src/screen/Setting/ContactScreen/repository/data/ContactData.dart';
import 'package:eser/src/utils/screen_export.dart';

class ContactApi {
  final _dio = DioHelper.instance;

  Future<dynamic> contact(ContactData model) async {
    try {
      log('Updating product: ${model.toString()}, ');
      final response = await _dio.post(
        Apiurl.message,
        data: model.toJson(),
        options: Options(extra: {'requiresAuthToken': true}),
      );
      log('Response: ${response.data}');
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data;
      } else {
        throw FetchException(
          message: "Failed to update product ${response.statusCode}",
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      log('Error updating product: $e');
      throw FetchException.fromDioError(e);
    } catch (e) {
      throw FetchException(message: e.toString());
    }
  }
}
