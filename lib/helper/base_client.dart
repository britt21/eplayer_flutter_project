import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eplayer_flutter_mobile/helper/app_exception.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.43.200:6969";

class BaseClient {
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
  Future<dynamic> patch(String api) async {
    try {
      var headers = {
        'Content-Type': 'application/json', // Set the content type to JSON
      };
      var response = await http
          .patch(Uri.parse("${baseUrl}/${api}"),headers: headers)

          .timeout(const Duration(seconds: TIME_OUT_DURATION));

      print(response.body);
      return proccessResponse(response);
    } on SocketException {
      return FetchDataException("No internet connection", api.toString());
    } on TimeoutException {
      return ApiNotRespondingException(
          "Api Taking too long to response", api.toString());
    }
  }

  Future<dynamic> post(String api, dynamic payloadobj) async {
    var payload = json.encode(payloadobj);
    var headers = {
      'Content-Type': 'application/json', // Set the content type to JSON
    };
    try {
      var response = await http
          .post(Uri.parse("$baseUrl/$api"), headers : headers, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));


      print("FULLDATA: ${response.body}");

      return proccessResponse(response);
    } on SocketException {
     throw FetchDataException("No internet connection", api.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "Api Taking too long to response", api.toString());
    }
  }

  dynamic proccessResponse(http.Response response) {

    print("IGOTSTATCODE: ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 400:

        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

         case 415:

           var responseJson = utf8.decode(response.bodyBytes);
           return responseJson;


      case 401:
      case 404:
      var responseJson = utf8.decode(response.bodyBytes);
      return responseJson;


      case 500:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 503:
        throw FetchDataException("An Error occured: ${response.statusCode}",
            response.request?.url.toString());

      default:
        throw FetchDataException("An Error occured: ${response.statusCode}",
            response.request?.url.toString());

    }
  }
}
