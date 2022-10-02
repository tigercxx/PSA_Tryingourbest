import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/designatedofficermodel.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:tryingoutbest/pages/unvalidateddisplay.dart';

import '../models/app.dart';

class DesignatedOfficerPage extends StatelessWidget {
  const DesignatedOfficerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var app = context.read<App>();

    var designatedOfficerModel = context.read<DesignatedOfficerModel>();
    designatedOfficerModel.updateUnvalidatedList(app.user_id.toString());
    return Material(
      child: Consumer<DesignatedOfficerModel>(
        builder: (context, value, child) {
          if (designatedOfficerModel.designated == 1) {
            Future<Null>.delayed(Duration.zero, () {
              _showToast(context);
            });
            designatedOfficerModel.designated = 0;
          }
          return Scaffold(
            body: Container(
              child: Column(children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFEDF3FA),
                  child: Stack(children: [
                    Positioned(
                      left: 330,
                      top: 10,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.logout_outlined,
                            size: 40,
                          )),
                    ),
                    Center(
                        child: Text(
                      "DigiPON",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ]),
                ),
                Consumer<DesignatedOfficerModel>(
                  builder: (context, value, child) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: Scrollbar(
                          child: ListView(
                        children: [
                          for (int index = 0;
                              index <
                                  designatedOfficerModel.unvalidatedList.length;
                              index++)
                            Card(
                              elevation: 5,
                              child: ListTile(
                                title: Text("PON ID"),
                                subtitle: Text(designatedOfficerModel
                                    .unvalidatedList[index].serialnumber),
                                trailing: Text(
                                  designatedOfficerModel
                                      .unvalidatedList[index].time_validated!,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UnvalidatedDisplay(
                                                ponDisplay:
                                                    designatedOfficerModel
                                                            .unvalidatedList[
                                                        index])),
                                  );
                                },
                              ),
                            )
                        ],
                      )),
                    );
                  },
                )
              ]),
            ),
          );
        },
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(
          'Designated',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
