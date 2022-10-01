import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryingoutbest/pages/loginpage.dart';
import '/models/app.dart';
import '/models/requestcsomodel.dart';
import 'models/aetosmodel.dart';
import 'models/designatedofficermodel.dart';
import 'pages/requestercsopage.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => App(0)),
    ChangeNotifierProvider(create: (context) => RequestCSOModel()),
    ChangeNotifierProvider(create: (context) => DesignatedOfficerModel()),
    ChangeNotifierProvider(create: (context) => AETOSModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove debug banner
        debugShowCheckedModeBanner: false,
        title: 'digiPON',
        home: const RolePage());
  }
}

// Main Page
class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAF6ED),
        body: Column(
          children: [
            Container(
              height: 150,
              color: Colors.transparent,
            ),
            Container(
              child: Image.asset('assets/images/PSA.png'),
            ),
            Container(
              height: 50,
            ),
            Container(
                child: Text(
              "Select Role",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            Container(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 300,
                color: Colors.transparent,
                child: Container(
                  // padding: const EdgeInsets.only(left: 20, top: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color(0xFF505050))),
                  child: Center(
                    child: Text(
                      "Requestor or Countersigning",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF505050)),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            position: 1,
                          )),
                );
              },
            ),
            Container(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 300,
                color: Colors.transparent,
                child: Container(
                  // padding: const EdgeInsets.only(left: 20, top: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color(0xFF129793))),
                  child: Center(
                    child: Text(
                      "Designated Officer",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF129793)),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            position: 2,
                          )),
                );
              },
            ),
            Container(
              height: 10,
            ),
            InkWell(
              child: Container(
                height: 40,
                width: 300,
                color: Colors.transparent,
                child: Container(
                  // padding: const EdgeInsets.only(left: 20, top: 2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color(0xFFFF7260))),
                  child: Center(
                    child: Text(
                      "AETOS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF7260)),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            position: 3,
                          )),
                );
              },
            ),
          ],
        ));
  }
}
