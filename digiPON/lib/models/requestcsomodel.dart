import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';

class RequestCSOModel extends ChangeNotifier {
  List<PON> taskList = [];
  List<PON> currentRequests = [];
  int authorised = 0;

  set setConfirmation(int num) {
    authorised = num;
    notifyListeners();
  }

  // function to update current requests and task list and notify listeners.
  void updateTaskList() {
    for (int i = 1; i < PONData.length; i++) {
      taskList.add(PONData[i]);
    }
  }

  void updateCurrentRequests() {
    for (int i = 1; i < PONData.length; i++) {
      currentRequests.add(PONData[i]);
    }
  }
}
