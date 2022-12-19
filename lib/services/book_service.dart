part of 'services.dart';

class BookService {
  static Future<Map<String, dynamic>> getAllBook() async {
    var response = await http.get(
        Uri.http(Const.apiUrl, "${Const.apiDir}user/book"),
        headers: Const.apiHeadersApps(await StorageManager.getToken()));

    var job = json.decode(response.body);

    Map<String, dynamic> result = {};
    result['status'] = job['data']['status'];
    result['message'] = job['data']['message'];
    if (job['data']['status'] == true) {
      result['results'] = job['data']['results'];
    }

    return result;
  }

  static Future<Map<String, dynamic>> storePinjamBuku(int bookId) async {
    var response = await http.post(
        Uri.http(Const.apiUrl, "${Const.apiDir}user/book"),
        headers: Const.apiHeadersApps(await StorageManager.getToken()),
        body: jsonEncode(<String, dynamic>{
          'userId': await StorageManager.getUid(),
          'bookId': bookId
        }));

    var job = json.decode(response.body);

    Map<String, dynamic> result = {};
    result['status'] = job['data']['status'];
    result['message'] = job['data']['message'];
    if (job['data']['status'] == true) {
      result['results'] = job['data']['results'];
      StorageManager.saveUser(json.encode(result['results']).toString());
    }

    return result;
  }

  static Future<Map<String, dynamic>> deletePinjam(int pinjamId) async {
    var response = await http.post(
        Uri.http(
            Const.apiUrl, "${Const.apiDir}user/book/destroy_pinjam/$pinjamId"),
        headers: Const.apiHeadersApps(await StorageManager.getToken()),
        body: jsonEncode(<String, dynamic>{'_method': 'DELETE'}));

    var job = json.decode(response.body);

    Map<String, dynamic> result = {};
    result['status'] = job['data']['status'];
    result['message'] = job['data']['message'];
    if (job['data']['status'] == true) {
      result['results'] = job['data']['results'];
      StorageManager.saveUser(json.encode(result['results']).toString());
    }

    return result;
  }
}
