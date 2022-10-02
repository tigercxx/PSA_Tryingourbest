import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AETOSModel extends ChangeNotifier {
  List<PON> authorisedList = [];
  int verified = 0;
  String task_id = '0';
  bool blockchain_checked = false;

  Future<void> checkOnBlockchain(String task_id) async {
    blockchain_checked = false;
    String url =
        'https://tryingoutbest.herokuapp.com/api/checkBlockchain/$task_id';
    var response = await http.get(Uri.parse(url), headers: {
      "content-type": "application/json",
      "accept": "application/json",
    });
    print("blockchain response");
    print(response.body);
    if (response.statusCode == 200) {
      print("blockchian true");
      blockchain_checked = true;
    }
    notifyListeners();
  }

  set setTaskID(String id) {
    task_id = id;
  }

  set setConfirmation(int num) {
    verified = num;
    notifyListeners();
  }

  // function to update current requests and task list and notify listeners.
  void updateAuthorisedList() async {
    final result = await retrieveUnverifiedList();
    authorisedList =
        (jsonDecode(result.body) as List).map((i) => PON.fromJson(i)).toList();
    notifyListeners();
  }
}

Future<Response> retrieveUnverifiedList() async {
  String url = 'https://tryingoutbest.herokuapp.com/api/unverified';
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
