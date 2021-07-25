import 'get_from_server.dart';

Future<int> setData(String tableName) async {
  var userBody = await getData(tableName);
  return userBody['count'];
}

Future<List> setSummayData(String tableName) async {
  var userBody = await getData(tableName);
  List temp = userBody['results'];
  return temp;
}

Future<List> getTestDetailsByUser(String username, String tableName) async {
  var body = await getData(tableName);
  List result = body['results'];
  List cResult = removeDuplicate(result);
  List temp = [];
  for (int i = 0; i < cResult.length; i++){
    if (cResult[i]['user_name'] == username){
      temp.add(cResult[i]);
      return temp;
    }
  }
  return temp;
}

Future<List> setUserDoc() async {
  int user = await setData('/users_tbl/');
  int docs = await setData('/vaccine_test/');
  return [user, docs];
}

List removeDuplicate(List res) {
  List temp = [];
  for (int i = 0; i < res.length; i++) {
    bool ins = true;
    if (temp.isEmpty) {
      temp.add(res[i]);
    } else {
      for (int j = 0; j < temp.length; j++) {
        if (res[i]['user_name'] == temp[j]['user_name']) {
          ins = false;
        }
      }
      if (ins) temp.add(res[i]);
    }
  }
  return temp;
}

Future<List> setRCPTRPieChart(String tableName, String colName) async {
  var rbody = await getData(tableName); //vaccine_test
  List result = rbody['results'];
  List negative = [];
  List positive = [];
  List cResult = removeDuplicate(result);

  for (int i = 0; i < cResult.length; i++){
    if (cResult[i][colName] == 'N'){
      negative.add(cResult[i]);
    } else if (cResult[i][colName] == 'P') {
      positive.add(cResult[i]);
    }
  }
  return [negative, positive];
}

Future<List> setVaccinePieChart(String tableName, String colName) async {
  var rbody = await getData(tableName); //vaccine_test
  List result = rbody['results'];
  List nodose = [];
  List dose1 = [];
  List dose2 = [];
  List dose3= [];
  List cResult = removeDuplicate(result);

  for (int i = 0; i < cResult.length; i++){
    if (cResult[i][colName] == '0'){
      nodose.add(cResult[i]);
    } else if (cResult[i][colName] == '1') {
      dose1.add(cResult[i]);
    }else if (cResult[i][colName] == '2') {
      dose2.add(cResult[i]);
    }else if (cResult[i][colName] == '3') {
      dose3.add(cResult[i]);
    }
  }
  return [nodose, dose1, dose2, dose3];
}

Future<List> setDetails(String tableName) async {
  var body = await getData(tableName);
  List result = body['results'];
  List Cresult = removeDuplicate(result);
  return Cresult;
}

Future<String> getFirstnameLastname(String username) async {
  var body = await getData('/users_tbl/');
  List result = body['results'];
  String name;

  for (int i = 0; i < result.length; i++){
    if (result[i]['username'] == username){
      name = "${result[i]['firstname']} ${result[i]['lastname']}";
    }
  }
  return name;
}

void postRCPTRResult(String username, String result) async {
  print(username);
  print(result);
  
}
