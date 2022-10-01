import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/app.dart';
import 'package:tryingoutbest/models/requestcsomodel.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import 'package:tryingoutbest/pages/taskdisplay.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    var requestCSOModel = context.read<RequestCSOModel>();
    requestCSOModel.updateTaskList();
    return Consumer<RequestCSOModel>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.width - 200,
          child: Scrollbar(
              child: ListView(
            children: [
              for (int index = 1; index < PONData.length; index++)
                Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text("Requester ID"),
                    subtitle:
                        Text(requestCSOModel.taskList[index].requester_id),
                    trailing: Text(formatDate(
                        requestCSOModel.taskList[index].time_validated,
                        [dd, '-', mm, '-', yyyy, ' ', HH, ':', mm])),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskDisplay(
                                ponDisplay: requestCSOModel.taskList[index])),
                      );
                    },
                  ),
                )
            ],
          )),
        );
      },
    );
  }
}
