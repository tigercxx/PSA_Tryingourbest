import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import '/models/app.dart';
import 'package:flutter/material.dart';
import '/pages/requestercsopage.dart';
import '/pages/aetospage.dart';
import '/pages/designatedofficerpage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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
    var app = context.read<App>();
    var color;
    var page;
    var loginurl;
    if (widget.position == 1) {
      color = Color(0xFFFAF6ED);
      page = RequesterCSOPage(
        index: 1,
      );
      loginurl = '/requester';
    } else if (widget.position == 2) {
      color = Color(0xFFEDF3FA);
      page = DesignatedOfficerPage();
      loginurl = '/designated_officer';
    } else if (widget.position == 3) {
      color = Color(0xFFFAEDED);
      page = AETOSPage();
      loginurl = '/aetos';
    }
    return Material(
      child: Scaffold(
        body: Container(
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
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF7260)),
                        child: const Text('Login'),
                        onPressed: () async {
                          final response = await login(nameController.text,
                              passwordController.text, loginurl);
                          if (response.statusCode == 200) {
                            app.setUserID = int.parse(response.body);
                            print(app.user_id);
                            print(response.statusCode);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
                          } else {
                            print(response.statusCode);
                            _showToast(context);
                          }
                        },
                      )),
                ],
              )),
        ),
      ),
    );
  }
}

Future<Response> login(String username, String password, String endurl) async {
  String url = 'https://tryingoutbest.herokuapp.com/api$endurl';
  var response = await http.post(Uri.parse(url),
      body: jsonEncode({'username': username, 'password': password}),
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

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text(
        'Login Failed',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
