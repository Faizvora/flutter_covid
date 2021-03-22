import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData {
  Future<String> getUser(String emailorusername) async {
    // String url = 'https://randomuser.me/api/?results=5';
    String url = 'http://195.229.90.114:4444/users_tbl/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    return resp.body;

    // if (resp.statusCode == 200) {
    //   return jsonDecode(resp.body);
    // } else {
    //   return 'no users';
    // }
  }
}
