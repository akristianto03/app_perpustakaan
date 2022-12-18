part of 'services.dart';

class AuthService {
  static Future<Map<String, dynamic>> register(String name, String email,
      String password, String passwordVerification, bool isAdmin) async {
    var response =
        await http.post(Uri.http(Const.apiUrl, "${Const.apiDir}register"),
            headers: Const.apiHeaders,
            body: jsonEncode(<String, dynamic>{
              'name': name,
              'email': email,
              'password': password,
              'password_confirmation': passwordVerification,
              'isAdmin': isAdmin == false ? 0 : 1
            }));

    var job = json.decode(response.body);

    Map<String, dynamic> result = {};
    result['status'] = job['data']['status'];
    result['message'] = job['data']['message'];

    return result;
  }

  static Future<Map<String, dynamic>> login(String email, String pass) async {
    var response =
        await http.post(Uri.http(Const.apiUrl, "${Const.apiDir}login"),
            headers: Const.apiHeaders,
            body: jsonEncode(<String, dynamic>{
              'email': email,
              'password': pass,
            }));

    var job = json.decode(response.body);

    Map<String, dynamic> result = {};
    result['status'] = job['data']['status'];
    result['message'] = job['data']['message'];

    if (job['data']['status'] == true) {
      StorageManager.setEmail(email);
      StorageManager.setPass(pass);
      StorageManager.setToken(job['data']['results']['access_token']);

      print(
          '${Const.apiDir}user/${job['data']['results']['user_id'].toString()}');

      var userResponse = await http.get(
          Uri.https(Const.apiUrl,
              "${Const.apiDir}user/${job['data']['results']['user_id'].toString()}"),
          headers: Const.apiHeadersApps(await StorageManager.getToken()));
      var user = json.decode(userResponse.body);

      if (user['data']['status'] == true) {
        StorageManager.saveUser(
            json.encode(user['data']['results']).toString());
      } else {}

      StorageManager.setUid(user['data']['results']['id']);

      result['statusUser'] = user['data']['status'];
      result['messageUser'] = user['data']['message'];
    }

    return result;
  }

  // GET USER DATA
  static Future<Map<String, dynamic>> getUserData(String uid) async {
    var response = await http.get(
        Uri.https(Const.apiUrl, "${Const.apiDir}user/$uid"),
        headers: Const.apiHeadersApps(await StorageManager.getToken()));

    var user = json.decode(response.body);

    Map<String, dynamic> result = user['data']['results'];

    return result;
  }
}
