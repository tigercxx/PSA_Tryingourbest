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
  String? requester_id;
  String? designated_id;
  String? cso_id;
  String? aetos_id;

//Required Info
  String company_name;
  String vehicle_no;
  String driver_name;
  String driver_psa_pass_no;
  String description;
  String attachments;

//State
  bool? validated;
  String? time_validated;
  bool? authorised;
  String? time_authorised;
  bool? verified;
  String? time_verified;

  PON(
      this.serialnumber,
      this.requester_id,
      this.designated_id,
      this.cso_id,
      this.aetos_id,
      this.company_name,
      this.vehicle_no,
      this.driver_name,
      this.driver_psa_pass_no,
      this.description,
      this.attachments,
      [this.validated,
      this.time_validated,
      this.authorised,
      this.time_authorised,
      this.verified,
      this.time_verified]);

  factory PON.fromJson(Map<String, dynamic> json) {
    return PON(
        json['id'].toString(),
        json['createdBy'] == null ? "0" : json['createdBy']['id'].toString(),
        json['validatedBy'] == null
            ? "0"
            : json['validatedBy']['id'].toString(),
        json['authorisedBy'] == null
            ? "0"
            : json['authorisedBy']['username'].toString(),
        json['verifiedBy'] == null ? "0" : json['verifiedBy']['id'].toString(),
        json['company_name'],
        json['vehicle_no'],
        json['driver_name'],
        json['driver_psa_pass_no'],
        json['description'],
        json['attachments'],
        json['validated'],
        json['time_validated'] ?? "0",
        json['authorised'],
        json['time_authorised'] ?? "0",
        json['verified'],
        json['time_verified'] ?? "0");
  }
}

List<PON> PONData = [
  PON(
      '1',
      '1',
      '2',
      '3',
      '4',
      'McDonalds',
      'SMU5555',
      'Harry',
      '123456789',
      '1 bag of peanuts',
      'attachment',
      true,
      "22 Sep 2022 19:50",
      false,
      "22 Sep 2022 19:50",
      false,
      "22 Sep 2022 19:50"),
  PON(
    '2',
    '1',
    '2',
    '3',
    '4',
    'McDonalds',
    'SMU5555',
    'Harry',
    '123456789',
    '1 bag of peanuts',
    'attachment',
    true,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
  ),
  PON(
    '3',
    '1',
    '2',
    '3',
    '4',
    'McDonalds',
    'SMU5555',
    'Harry',
    '123456789',
    '1 bag of peanuts',
    'attachment',
    true,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
  ),
  PON(
    '4',
    '1',
    '2',
    '3',
    '4',
    'McDonalds',
    'SMU5555',
    'Harry',
    '123456789',
    '1 bag of peanuts',
    'attachment',
    true,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
  ),
  PON(
    '5',
    '1',
    '2',
    '3',
    '4',
    'McDonalds',
    'SMU5555',
    'Harry',
    '123456789',
    '1 bag of peanuts',
    'attachment',
    true,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
  ),
  PON(
    '6',
    '1',
    '2',
    '3',
    '4',
    'McDonalds',
    'SMU5555',
    'Harry',
    '123456789',
    '1 bag of peanuts',
    'attachment',
    true,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
    false,
    "22 Sep 2022 19:50",
  ),
];
