import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHandler {
  static Future<http.Response?> getMethodCall(
      {String? url, Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.tryParse(
          url!,
        )!,
        headers: headers,
      );
      return response;
    } catch (error) {
      print("Error ha $error");
    }
  }


  static Future<http.Response?> postMethodCall(
      {String? url, Map<String, String>? headers,Map<String,dynamic>? body}) async {

    var myData = json.encode(body);


    try {

      final response = await http.post(
        Uri.tryParse(
          url!,
        )!,
        headers: headers,
        body: myData
      );
      return response;
    } catch (error) {
      print("Error ha $error");
    }
  }

}
