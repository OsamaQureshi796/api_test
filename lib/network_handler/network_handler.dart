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
}
