import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';

class DesignatedOfficerModel extends ChangeNotifier {
  List<PON> unvalidatedList = [];
  // function to update current requests and task list and notify listeners.
  void updateUnvalidatedList() {
    unvalidatedList = [];
    for (int i = 1; i < PONData.length; i++) {
      unvalidatedList.add(PONData[i]);
    }
  }
}
