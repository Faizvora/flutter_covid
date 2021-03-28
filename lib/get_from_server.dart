import 'package:covid_vaccine/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class FetchData {
  String api_url = 'http://195.229.90.114:4444';

  Future<Map> getUser(String emailorusername) async {
    String url = api_url + '/users_tbl/' + emailorusername + '?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<Map> getAdminUser() async {
    String url = api_url + '/admin_tbl/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<http.Response> postUser(
      String f_name,
      String l_name,
      String u_name,
      String email_id,
      String password,
      String cnf_password,
      String mobile_no) async {
    String url = api_url + '/users_tbl/';
    if (password == cnf_password) {
      Map<String, String> headers = {"Content-type": 'application/json'};
      Map data = {
        'firstname': f_name,
        'lastname': l_name,
        'username': u_name,
        'email_id': email_id,
        'password': password,
        'mobile_no': mobile_no,
      };
      String body = json.encode(data);
      return await http.post(Uri.parse(url), headers: headers, body: body);
    }
  }

  Future<bool> postDoc(String username, String test_type, String test_date,
      String created_by, String filepath, File file) async {
    String url = api_url + '/upload/';

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['username'] = username
      ..files.add(await http.MultipartFile.fromPath('file_upload', file.path));
    var resp = await request.send();

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map> get_appointments() async {
    String url = api_url + '/appointment/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<Map> get_tests() async {
    String url = api_url + "/test/?format=json";
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<int> get_n_users() async {
    String url = api_url + "/users_tbl/?format=json";
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res['results'].length;
  }

  Future<int> get_n_appointments() async {
    String url = api_url + '/appointment/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res['results'].length;
  }

  Future<int> get_n_tests() async {
    String url = api_url + '/test/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res['results'].length;
  }
}
