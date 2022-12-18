part of 'shared.dart';

class Const {
  static String baseUrl = "http://web-perpustakaan.test";

  static String apiUrl = "web-perpustakaan.test";
  static String apiDir = "/api/";

  static Map<String, String> apiHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Map<String, String> apiHeadersApps(token) {
    String bearerAuth = 'Bearer ' + token;
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': bearerAuth,
    };
    return headers;
  }
}
