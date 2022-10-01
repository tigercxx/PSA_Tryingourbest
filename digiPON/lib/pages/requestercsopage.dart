import 'package:flutter/material.dart';
import 'package:tryingoutbest/main.dart';
import '../models/requestcsomodel.dart';
import 'package:tryingoutbest/widgets/request_form.dart';
import '../widgets/current_requests.dart';
import '../widgets/task_list.dart';
import 'package:provider/provider.dart';

class RequesterCSOPage extends StatefulWidget {
  const RequesterCSOPage({super.key, required this.index});
  final index;

  @override
  State<RequesterCSOPage> createState() => _RequesterCSOPageState();
}

class _RequesterCSOPageState extends State<RequesterCSOPage> {
  late var toggleindex = widget.index;
  var page;
  void _onToggle(int index) {
    setState(() {
      toggleindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var requestCSOModel = context.watch<RequestCSOModel>();
    // print(requestCSOModel.authorised);
    return Scaffold(
      body: Consumer<RequestCSOModel>(
        builder: (context, value, child) {
          if (requestCSOModel.authorised == 1) {
            Future<Null>.delayed(Duration.zero, () {
              _showToast(context);
            });
            requestCSOModel.authorised = 0;
          }
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFFAF6ED),
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
                    Positioned(
                        top: 140,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  color: Colors.transparent,
                                  child: Container(
                                    // padding: const EdgeInsets.only(left: 20, top: 2),
                                    decoration: BoxDecoration(
                                        color: toggleindex == 1
                                            ? Color(0xFFD0D0D0)
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                            color: Color(0xFF505050))),
                                    child: Center(
                                      child: Text(
                                        "Request Form",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF505050)),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _onToggle(1);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  color: Colors.transparent,
                                  child: Container(
                                    // padding: const EdgeInsets.only(left: 20, top: 2),
                                    decoration: BoxDecoration(
                                        color: toggleindex == 2
                                            ? Color(0xFFD0D0D0)
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                            color: Color(0xFF505050))),
                                    child: Center(
                                      child: Text(
                                        "Task List",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF505050)),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _onToggle(2);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  color: Colors.transparent,
                                  child: Container(
                                    // padding: const EdgeInsets.only(left: 20, top: 2),
                                    decoration: BoxDecoration(
                                        color: toggleindex == 3
                                            ? Color(0xFFD0D0D0)
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                            color: Color(0xFF505050))),
                                    child: Container(
                                      // margin: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Current Requests",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF505050)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  _onToggle(3);
                                },
                              ),
                            ],
                          ),
                        ))
                  ]),
                ),
                toggleindex == 1
                    ? RequestForm()
                    : toggleindex == 2
                        ? Expanded(child: TaskList())
                        : Expanded(child: CurrentRequests()),
                // Container(
                //   height: 50,
                // )
              ]),
            ),
          );
        },
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text(
        'Authorised',
        style: TextStyle(color: Colors.green),
      ),
    ),
  );
}
