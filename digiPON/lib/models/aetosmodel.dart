import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';

class AETOSModel extends ChangeNotifier {
  List<PON> authorisedList = [];
  int verified = 0;

  set setConfirmation(int num) {
    verified = num;
    notifyListeners();
  }

  // function to update current requests and task list and notify listeners.
  void updateAuthorisedList() {
    authorisedList = [];
    for (int i = 1; i < PONData.length; i++) {
      authorisedList.add(PONData[i]);
    }
  }
}
