import 'package:flutter/material.dart';
import 'package:tryingoutbest/widgets/task_list.dart';
import 'app.dart';

class AETOSModel extends ChangeNotifier {
  List<PON> authorisedList = [];
  // function to update current requests and task list and notify listeners.
  void updateAuthorisedList() {
    authorisedList = [];
    for (int i = 1; i < PONData.length; i++) {
      authorisedList.add(PONData[i]);
    }
  }
}
