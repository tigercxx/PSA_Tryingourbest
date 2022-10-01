import 'package:flutter/material.dart';

class App extends ChangeNotifier {
  // String keyword;
  int user_id;

  // set setKeyword(String value) {
  //   keyword = value;
  //   notifyListeners();
  // }

  App(this.user_id);

  set setUserID(int id) {
    user_id = id;
  }
}

class PON {
  String serialnumber;
  String requester_id;
  String cso_id;

//Required Info
  String company_name;
  String vehicle_no;
  String driver_name;
  String driver_psa_pass_no;
  String description;

//State
  bool? validated;
  DateTime time_validated;
  bool authorised;
  DateTime time_authorised;
  bool verified;
  DateTime time_verified;

  PON(
      this.serialnumber,
      this.requester_id,
      this.cso_id,
      this.company_name,
      this.vehicle_no,
      this.driver_name,
      this.driver_psa_pass_no,
      this.description,
      this.validated,
      this.time_validated,
      this.authorised,
      this.time_authorised,
      this.verified,
      this.time_verified);
}

List<PON> PONData = [
  PON(
      '1',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
  PON(
      '2',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
  PON(
      '3',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
  PON(
      '4',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
  PON(
      '5',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
  PON(
      '6',
      '1',
      '2',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      true,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30),
      false,
      DateTime(2022, 9, 7, 17, 30)),
];
