import 'package:flutter/material.dart';
import 'package:tryingoutbest/pages/requestercsopage.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController companyNameController = TextEditingController();
    TextEditingController vehicleNoController = TextEditingController();
    TextEditingController driverNameController = TextEditingController();
    TextEditingController driverPSAPassNoController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListView(
            children: <Widget>[
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
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Attachments',
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                  color: Colors.transparent,
                  height: 40,
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFFFF7260)),
                    child: const Text('Submit'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequesterCSOPage(
                                  index: 3,
                                )),
                      );
                    },
                  )),
            ],
          )),
    );
  }
}
