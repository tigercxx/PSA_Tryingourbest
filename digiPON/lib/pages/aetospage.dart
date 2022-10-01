import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

import '../models/aetosmodel.dart';
import 'authoriseddisplay.dart';

class AETOSPage extends StatelessWidget {
  const AETOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    var aetosModel = context.read<AETOSModel>();
    aetosModel.updateAuthorisedList();
    return Material(
      child: Container(
        child: Column(children: [
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFAEDED),
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
          Consumer<AETOSModel>(
            builder: (context, value, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: Scrollbar(
                    child: ListView(
                  children: [
                    for (int index = 1;
                        index < aetosModel.authorisedList.length;
                        index++)
                      Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text("Requester ID"),
                          subtitle: Text(
                              aetosModel.authorisedList[index].requester_id),
                          trailing: Text(formatDate(
                              aetosModel.authorisedList[index].time_validated,
                              [dd, '-', mm, '-', yyyy, ' ', HH, ':', mm])),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthorisedDisplay(
                                      ponDisplay:
                                          aetosModel.authorisedList[index])),
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
