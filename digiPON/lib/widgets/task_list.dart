import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/app.dart';
import 'package:tryingoutbest/models/requestcsomodel.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import 'package:tryingoutbest/pages/taskdisplay.dart';

class TaskList extends StatefulWidget {
  TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     var app = context.read<App>();
  //     var requestCSOModel = context.read<RequestCSOModel>();
  //     requestCSOModel.updateTaskList(app.user_id.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var app = context.read<App>();
    var requestCSOModel = context.read<RequestCSOModel>();
    requestCSOModel.updateTaskList(app.user_id.toString());
    return Consumer<RequestCSOModel>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.width - 200,
          child: Scrollbar(
              child: ListView(
            children: [
              for (int index = 0;
                  index < requestCSOModel.taskList.length;
                  index++)
                Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text("PON ID"),
                    subtitle:
                        Text(requestCSOModel.taskList[index].serialnumber!),
                    trailing: Text(
                      requestCSOModel.taskList[index].time_validated!,
                    ),
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
