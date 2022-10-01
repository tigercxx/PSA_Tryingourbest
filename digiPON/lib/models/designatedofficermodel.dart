import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';

class DesignatedOfficerModel extends ChangeNotifier {
  List<PON> unvalidatedList = [];
  List<CSO> availableCSOList = [];
  String dropdownValue = '';
  // function to update current requests and task list and notify listeners.
  void updateUnvalidatedList() {
    unvalidatedList = [];
    for (int i = 1; i < PONData.length; i++) {
      unvalidatedList.add(PONData[i]);
    }
  }

  void updateavailableCSOList() {
    availableCSOList = [];
    for (int i = 0; i < availableCSO.length; i++) {
      availableCSOList.add(availableCSO[i]);
    }
  }

  List<String> availableCSOStringList = [];
  void updateStringList() {
    availableCSOStringList = [];
    for (int i = 0; i < availableCSOList.length; i++) {
      availableCSOStringList.add(availableCSOList[i].username);
    }
    dropdownValue = availableCSOStringList.first;
  }

  set setDropdownValue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}

class CSO {
  String username;
  int user_id;

  CSO(this.username, this.user_id);
}

List<CSO> availableCSO = [
  CSO('Kevin', 1),
  CSO('Javier', 2),
  CSO('Julia', 3),
  CSO('Guatemala', 4)
];
