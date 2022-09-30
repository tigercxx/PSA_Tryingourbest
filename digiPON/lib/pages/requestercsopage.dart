import 'package:flutter/material.dart';
import 'package:tryingoutbest/main.dart';

class RequesterCSOPage extends StatelessWidget {
  const RequesterCSOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              Positioned(
                  top: 140,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.transparent,
                          child: Container(
                            // padding: const EdgeInsets.only(left: 20, top: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(color: Color(0xFF505050))),
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
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.transparent,
                          child: Container(
                            // padding: const EdgeInsets.only(left: 20, top: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(color: Color(0xFF505050))),
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
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.transparent,
                          child: Container(
                            // padding: const EdgeInsets.only(left: 20, top: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(color: Color(0xFF505050))),
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
                      ],
                    ),
                  ))
            ]),
          ),
        ]),
      ),
    );
  }
}
