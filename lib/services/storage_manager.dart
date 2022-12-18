part of 'services.dart';

class StorageManager {
  static void firstTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('first', '1');
  }

  static void setUid(var uid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('uid', uid.toString());
  }

  static Future<String> getUid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid = pref.getString('uid');
    return uid.toString();
  }

  static void setEmail(var email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  static Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString('email');
    return email.toString();
  }

  static void setPass(var pass) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pass', pass);
  }

  static Future<String> getPass() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? pass = pref.getString('pass');
    return pass.toString();
  }

  static void setToken(var token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    return token.toString();
  }

  static void saveUser(String user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> decodeOpt = jsonDecode(user);
    String strUser = jsonEncode(decodeOpt);
    pref.setString('user', strUser);
  }

  static Future<Map<String, dynamic>> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userPref = pref.getString('user');
    Map<String, dynamic> json = jsonDecode(userPref.toString());
    print(json);
    return json;
  }

  static Future<bool> deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  static Future<bool> deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
