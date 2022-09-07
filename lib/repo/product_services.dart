import 'dart:io';
import 'package:flutter_mvvm/model/product_list_model.dart';
import 'package:flutter_mvvm/repo/api_status.dart';
import 'package:flutter_mvvm/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<Object> getProduct() async {
    try {
      var response = await http.get(
          Uri.parse("https://api.mercadolibre.com/sites/MLB/search?q=gaming"));
      if (SUCCESS == response.statusCode) {
        return Success(response: productModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
