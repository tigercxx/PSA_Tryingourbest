import 'package:flutter/material.dart';
import '/pages/requestercsopage.dart';
import '/pages/aetospage.dart';
import '/pages/designatedofficerpage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.position}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
  int position;
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var color;
    var page;
    if (widget.position == 1) {
      color = Color(0xFFFAF6ED);
      page = RequesterCSOPage();
    } else if (widget.position == 2) {
      color = Color(0xFFEDF3FA);
      page = DesignatedOfficerPage();
    } else if (widget.position == 3) {
      color = Color(0xFFFAEDED);
      page = AETOSPage();
    }
    return Material(
      child: Container(
        color: color,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    height: 30,
                    width: 500,
                    alignment: Alignment.topLeft,
                    color: color,
                    child: const BackButton()),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/PSA.png")),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                    color: color,
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFFFF7260)),
                      child: const Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => page),
                        );
                      },
                    )),
              ],
            )),
      ),
    );
  }
}
