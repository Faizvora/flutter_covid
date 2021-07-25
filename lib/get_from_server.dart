import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// String apiUrl = 'http://195.229.90.114:4444 ';
String apiUrl = 'http://34.219.149.53:8080';
// String apiUrl = 'http://10.0.2.2:8000';

//working
Future<Map> getData(String uri) async {
  String url = apiUrl + uri + '?format=json';
  Map res = {'error': 'error'};
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200 || response.statusCode == 201) {
    res = jsonDecode(response.body);
    return res;
  } else {
    return res;
  }
}

//working
Future<bool> postResult(String username, String result) async {
  String url = apiUrl + '/rcptr_test/';
  Map<String, String> headers = {'Content-type': 'application/json'};
  Map data = {
    'user_name': username,
    'r_result': result,
  };
  String body = json.encode(data);
  print(data);
  print(body);
  http.Response resp = await http.post(Uri.parse(url), headers: headers, body: body);
  print('updating result');
  print(resp.body);
  return resp.body.contains('user_name') ? true : false;
}

//working
Future<bool> postUser(
  String firstName, String lastName, String username,
  String emailId, String password, String mobileNo) async {

    String url = apiUrl + '/users_tbl/';
    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['email_id'] = emailId
      ..fields['username'] = username
      ..fields['password'] = password
      ..fields['firstname'] = firstName
      ..fields['lastname'] = lastName
      ..fields['mobile_no'] = mobileNo;
    
    var resp = await request.send();
    http.Response hresp = await http.Response.fromStream(resp);
    print('creating user');
    print(hresp.body);
    print(hresp.body == 'CREATED' ? true : false);
    print(hresp.statusCode);

    return hresp.statusCode == 200 ? true : false;
}

// "user_name": "cyborg",
// "report_file": null,
// "dose": "0",

Future<bool> postDoc(String username, String dose, File file, String filepath) async {
  String url = apiUrl + '/vaccine_test/';
  var request = http.MultipartRequest('POST', Uri.parse(url))
    ..fields['user_name'] = username
    ..files.add(await http.MultipartFile.fromPath('report_file', file.path))
    ..fields['dose'] = dose;
  
  var resp = await request.send();
  http.Response hresp = await http.Response.fromStream(resp);
  print(resp.statusCode);
  return hresp.statusCode == 200 ? true : false;
}

/* database tables
users_tbl
admin_tbl
rcptr_test
vaccine_test

*/