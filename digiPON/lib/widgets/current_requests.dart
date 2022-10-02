import 'package:flutter/material.dart';
import '/models/app.dart';
import 'package:tryingoutbest/models/requestcsomodel.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';

class CurrentRequests extends StatelessWidget {
  const CurrentRequests({super.key});

  @override
  Widget build(BuildContext context) {
    var requestCSOModel = context.read<RequestCSOModel>();
    var app = context.read<App>();
    requestCSOModel.updateCurrentRequests(app.user_id.toString());
    return Consumer<RequestCSOModel>(builder: (context, value, child) {
      return SizedBox(
        height: MediaQuery.of(context).size.width - 200,
        child: Scrollbar(
            child: ListView(
          children: [
            for (int index = 0;
                index < requestCSOModel.currentRequests.length;
                index++)
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text("Requester ID"),
                  subtitle: Text(
                      requestCSOModel.currentRequests[index].requester_id!),
                  trailing: Text(
                    requestCSOModel.currentRequests[index].authorised!
                        ? 'Authorised'
                        : requestCSOModel.currentRequests[index].validated!
                            ? 'Validated: CSO is ${requestCSOModel.currentRequests[index].cso_id}'
                            : 'Unvalidated',
                  ),
                  onTap: () {},
                ),
              )
          ],
        )),
      );
    });
  }
}
