import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eplayer_flutter_mobile/helper/app_exception.dart';
import 'package:http/http.dart' as http;


class BaseClient {
  var baseUrl = "https://jsonplaceholder.typicode.com";
  static const int TIME_OUT_DURATION = 180;

  Future<dynamic> get(String api) async {
    try {
      var response = await http
          .get(Uri.parse("${baseUrl}/${api}"))
          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      print(response.body);
      return proccessResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection", api.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Taking too long to response", api.toString());
    }
  }

  void post(String api, dynamic payloadobj) async {
    var payload = jsonDecode(payloadobj);
    try {
      var response = await http
          .post(Uri.parse("${baseUrl}/${api}"), body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return proccessResponse(response);
    } on SocketException {
      FetchDataException("No internet connection", api.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Taking too long to response", api.toString());
    }
  }

  dynamic proccessResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 401:
      case 404:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request?.url.toString());

      case 500:
        throw FetchDataException("An Error occured: ${response.statusCode}",
            response.request?.url.toString());

      case 503:
        throw FetchDataException("An Error occured: ${response.statusCode}",
            response.request?.url.toString());

      default:
    }
  }
}
