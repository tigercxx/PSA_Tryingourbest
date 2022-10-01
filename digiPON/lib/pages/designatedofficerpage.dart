import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/designatedofficermodel.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:tryingoutbest/pages/unvalidateddisplay.dart';

class DesignatedOfficerPage extends StatelessWidget {
  const DesignatedOfficerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var designatedOfficerModel = context.read<DesignatedOfficerModel>();
    designatedOfficerModel.updateUnvalidatedList();
    return Material(
      child: Container(
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    for (int index = 1;
                        index < designatedOfficerModel.unvalidatedList.length;
                        index++)
                      Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text("Requester ID"),
                          subtitle: Text(designatedOfficerModel
                              .unvalidatedList[index].requester_id),
                          trailing: Text(formatDate(
                              designatedOfficerModel
                                  .unvalidatedList[index].time_validated,
                              [dd, '-', mm, '-', yyyy, ' ', HH, ':', mm])),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UnvalidatedDisplay(
                                      ponDisplay: designatedOfficerModel
                                          .unvalidatedList[index])),
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
  }
}
