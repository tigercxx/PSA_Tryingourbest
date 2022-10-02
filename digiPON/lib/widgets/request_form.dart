import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tryingoutbest/pages/requestercsopage.dart';
import '/pages/designatedofficerpage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '/models/app.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    var app = context.read<App>();
    TextEditingController companyNameController = TextEditingController();
    TextEditingController vehicleNoController = TextEditingController();
    TextEditingController driverNameController = TextEditingController();
    TextEditingController driverPSAPassNoController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController attachmentController = TextEditingController();
    var deviceheight = MediaQuery.of(context).size.height;
    print(MediaQuery.of(context).viewInsets.bottom);
    return Container(
      height: deviceheight - 200,
      padding: EdgeInsets.only(
          top: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 10,
          right: 10),
      child: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height - 200,
            padding: EdgeInsets.only(
                top: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 10,
                right: 10),
            child: ListView(
              children: <Widget>[
                // Container(
                //   height: 100,
                // ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: companyNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Company Name',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: vehicleNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Vehicle No.',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: driverNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Driver\'s Name',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: driverPSAPassNoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Driver\'s PSA Pass No.',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    maxLines: 5,
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: attachmentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Attachments',
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                    color: Colors.transparent,
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFFF7260)),
                      child: const Text('Submit'),
                      onPressed: () async {
                        final response = await createPON(
                            companyNameController.text,
                            vehicleNoController.text,
                            driverNameController.text,
                            driverPSAPassNoController.text,
                            descriptionController.text,
                            attachmentController.text,
                            app.user_id.toString());
                        if (response.statusCode == 200) {
                          _showToastSuccess(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequesterCSOPage(
                                      index: 3,
                                    )),
                          );
                        } else {
                          _showToastFail(context);
                        }
                      },
                    )),
                Container(
                  height: 20,
                )
              ],
            )),
      ),
    );
  }
}

Future<Response> createPON(
    String company_name,
    String vehicle_no,
    String driver_name,
    String driver_psa_pass_no,
    String description,
    String attachments,
    String requester_id) async {
  String url =
      'https://tryingoutbest.herokuapp.com/api/createTask/$requester_id';
  var response = await http.post(Uri.parse(url),
      body: jsonEncode({
        'company_name': company_name,
        'vehicle_no': vehicle_no,
        'driver_name': driver_name,
        'driver_psa_pass_no': driver_psa_pass_no,
        'description': description,
        'attachments': attachments
      }),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });
  if (response.statusCode == 200) {
    return response;
  } else {
    return Response('', 500);
  }
}

void _showToastSuccess(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text(
        'digiPON created',
        style: TextStyle(color: Colors.green),
      ),
    ),
  );
}

void _showToastFail(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text(
        'Error creating digiPON',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
