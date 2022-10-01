import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/app.dart';

class TaskDisplay extends StatelessWidget {
  const TaskDisplay({super.key, required this.ponDisplay});

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
        backgroundColor: Color(0xFFFAF6ED),
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
              child: const Text('Authorise'),
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
  return AlertDialog(
    title: const Text('Confirm Authorisation'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("ePON will be passed on to AETOS staff"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF129793))),
          onPressed: () {
            // put the serial number, cso_id and time authorised
            Navigator.of(context).pop();
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
