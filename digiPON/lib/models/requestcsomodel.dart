import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'package:http/http.dart' as http;

import 'app.dart';

class RequestCSOModel extends ChangeNotifier {
  List<PON> taskList = [];
  List<PON> currentRequests = [];
  int authorised = 0;
  String task_id = '0';

  set setTaskID(String id) {
    task_id = id;
  }

  set setConfirmation(int num) {
    authorised = num;
    notifyListeners();
  }

  // function to update current requests and task list and notify listeners.
  void updateTaskList(String user_id) async {
    final result = await retrieveTaskList(user_id);
    taskList =
        (jsonDecode(result.body) as List).map((i) => PON.fromJson(i)).toList();
    notifyListeners();
  }

  void updateCurrentRequests(String user_id) async {
    final result = await retrieveCurrentRequests(user_id);
    currentRequests =
        (jsonDecode(result.body) as List).map((i) => PON.fromJson(i)).toList();
    notifyListeners();
  }
}

Future<Response> retrieveCurrentRequests(String user_id) async {
  String url =
      'https://tryingoutbest.herokuapp.com/api/pendingRequest/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    "content-type": "application/json",
    "accept": "application/json",
  });
  print("response");
  if (response.statusCode == 200) {
    return response;
  } else {
    return Response('', 500);
  }
}

Future<Response> retrieveTaskList(String user_id) async {
  String url = 'https://tryingoutbest.herokuapp.com/api/allTasks/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    "content-type": "application/json",
    "accept": "application/json",
  });
  print("response");
  if (response.statusCode == 200) {
    return response;
  } else {
    return Response('', 500);
  }
}
