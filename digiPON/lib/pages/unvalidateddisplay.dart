import 'package:flutter/material.dart';
import 'package:tryingoutbest/models/app.dart';

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
              },
            )),
      ]),
    );
  }
}
