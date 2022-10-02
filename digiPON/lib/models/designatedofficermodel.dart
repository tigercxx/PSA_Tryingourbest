import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';
import 'package:http/http.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'package:http/http.dart' as http;
import 'requestcsomodel.dart';

class DesignatedOfficerModel extends ChangeNotifier {
  List<PON> unvalidatedList = [];
  List<CSO> availableCSOList = [];
  int designated = 0;

  String dropdownValue = '';
  String task_id = "0";
  String selected_cso = "1";
  // function to update current requests and task list and notify listeners.

  void updateUnvalidatedList(String user_id) async {
    final result = await retrieveUnvalidated(user_id);
    unvalidatedList =
        (jsonDecode(result.body) as List).map((i) => PON.fromJson(i)).toList();
    notifyListeners();
    print(unvalidatedList[0]);
  }

  void updateavailableCSOList(String user_id, String task_id) async {
    final result = await retrieveAvailableCSO(user_id, task_id);
    availableCSOList =
        (jsonDecode(result.body) as List).map((i) => CSO.fromJson(i)).toList();
    updateStringList();
    notifyListeners();
  }

  List<String> availableCSOStringList = [];
  void updateStringList() {
    availableCSOStringList = [];
    for (int i = 0; i < availableCSOList.length; i++) {
      availableCSOStringList.add(availableCSOList[i].username);
    }
    dropdownValue = availableCSOStringList.first;
  }

  set setConfirmation(int num) {
    designated = num;
    notifyListeners();
  }

  set setDropdownValue(String value) {
    dropdownValue = value;
    final index1 = availableCSOList
        .indexWhere((element) => element.username == dropdownValue);
    selected_cso = availableCSOList[index1].user_id.toString();
    notifyListeners();
  }

  set setTaskId(String id) {
    task_id = id;
  }
}

class CSO {
  String username;
  int user_id;

  CSO(this.username, this.user_id);

  factory CSO.fromJson(Map<String, dynamic> json) {
    return CSO(json["username"], json["id"]);
  }
}

List<CSO> availableCSO = [
  CSO('Kevin', 1),
  CSO('Javier', 2),
  CSO('Julia', 3),
  CSO('Guatemala', 4)
];

Future<Response> retrieveUnvalidated(String user_id) async {
  String url =
      'https://tryingoutbest.herokuapp.com/api/unvalidatedRequest/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    "content-type": "application/json",
    "accept": "application/json",
  });
  print("response for unvalidated");
  print(response.body);
  if (response.statusCode == 200) {
    return response;
  } else {
    return Response('', 500);
  }
}

Future<Response> retrieveAvailableCSO(String user_id, String task_id) async {
  String url =
      'https://tryingoutbest.herokuapp.com/api/availableCSO/$user_id/$task_id';
  var response = await http.get(Uri.parse(url), headers: {
    "content-type": "application/json",
    "accept": "application/json",
  });
  // print(response.body);
  if (response.statusCode == 200) {
    return response;
  } else {
    return Response('', 500);
  }
}
