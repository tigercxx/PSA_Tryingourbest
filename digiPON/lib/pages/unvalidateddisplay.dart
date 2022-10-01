import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/app.dart';
import 'package:provider/provider.dart';
import '../models/designatedofficermodel.dart';
import 'package:custom_radio_group_list/custom_radio_group_list.dart';

class UnvalidatedDisplay extends StatelessWidget {
  const UnvalidatedDisplay({super.key, required this.ponDisplay});

  final PON ponDisplay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "DigiPON",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFEDF3FA),
        foregroundColor: Colors.black,
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Company Name:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  ponDisplay.company_name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Vehicle No.:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  ponDisplay.vehicle_no,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Driver Name:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  ponDisplay.driver_name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Driver's PSA Pass no.:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  ponDisplay.driver_psa_pass_no,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  ponDisplay.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    "Attachments:",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 137, 137, 137)),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Icon(Icons.image)),
            ],
          ),
        ),
        Container(
          height: 30,
        ),
        Container(
            height: 50,
            width: 150,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xFF129793)),
              child: const Text('Validate'),
              onPressed: () {
                // PUT data and return to page once successful
                showDialog(
                    context: context,
                    builder: ((context) => _buildPopupDialog(context)));
              },
            )),
      ]),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  var designatedmodel = context.read<DesignatedOfficerModel>();
  designatedmodel.updateavailableCSOList();
  designatedmodel.updateStringList();
  return AlertDialog(
    title: const Text('Confirm Validation'),
    content: Container(
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("ePON will be passed on to selected Countersigning Officer"),
          Container(child: Consumer<DesignatedOfficerModel>(
            builder: (context, value, child) {
              print(designatedmodel.dropdownValue);
              print(designatedmodel.availableCSOList.first.username);
              print(designatedmodel.availableCSOList.length);
              print(designatedmodel.availableCSOStringList.first);
              print(designatedmodel.availableCSOStringList.length);
              return DropdownButton<String>(
                value: designatedmodel.dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                underline: Container(
                  height: 2,
                  color: Colors.black,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  designatedmodel.setDropdownValue = value!;
                },
                items: designatedmodel.availableCSOStringList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            },
          ))
        ],
      ),
    ),
    actions: <Widget>[
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF129793))),
          onPressed: () {
            // put the serial number, cso_id and time authorised
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Text("Confirm")),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFF7260))),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
