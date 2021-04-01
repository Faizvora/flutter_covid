import 'package:covid_vaccine/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FetchData {
  String api_url = 'http://195.229.90.114:4444';

  Future<Map> getUser(String emailorusername) async {
    String url = api_url + '/users_tbl/' + emailorusername + '?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<Map> getAllUser() async {
    String url = api_url + '/users_tbl/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<Map> getAppointmentType() async {
    String url = api_url + '/appointment_type/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }

  Future<Map> getCreatedBy() async {
    String url = api_url + '/admin_tbl/?format=json';
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

  Future<http.Response> postUser(String f_name,
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

  Future<http.Response> postAppointment(
      String user_name,
      String appointment_type,
      String appointment_date_time,
      String created_date,
      String created_by,
      ) async {
    DateTime dateTime = DateTime.tryParse(appointment_date_time);
    DateTime dateTime1 = DateTime.tryParse(created_date);
    print(dateTime);
    print(dateTime1);

    String url = api_url + '/appointment/';
    Map<String, String> headers = {'Content-type': 'application/json'};
    Map data = {
      'username': user_name,
      'appointment_type': appointment_type,
      'appointment_date_time': appointment_date_time,
      'created_date': created_date,
      'created_by': created_by,};
      String body = json.encode(data);

      return await http.post(Uri.parse(url), headers: headers, body: body);
    }

  Future<http.Response> postTest(String username,
      String test_type,
      String file_upload,
      String test_date,
      String created_by,
      bool is_active,
     ) async {
        String url = api_url + '/test/';
            Map<String, String> headers = {"Content-type": 'application/json'};
            Map data = {
              "username": username,
              "test_type": test_type,
              "file_upload": file_upload,
              "test_date": test_date,
              "created_by": created_by,
              "is_active": is_active,};
            String body = json.encode(data);
            return await http.post(Uri.parse(url), headers: headers, body: body);
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
    return res['count'];
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

  Future<int> get_n_docs() async {
    String url = api_url + '/upload/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res['results'].length;
  }

  Future<Map> getAlldocs() async {
    String url = api_url + '/upload/?format=json';
    http.Response resp = await http.get(Uri.parse(url));
    Map res = jsonDecode(resp.body);
    return res;
  }
}