// To parse this JSON data, do
//
//     final patient = patientFromJson(jsonString);

import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  String firstName;
  String lastName;
  String dateOfBirth;
  int age;
  String gender;
  String phoneNumber;
  String phoneType;
  String email;

  Patient({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.phoneNumber,
    this.phoneType,
    this.email,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        firstName: json["ClientFirstName"],
        lastName: json["ClientLastName"],
        dateOfBirth: json["DateOfBirth"],
        age: json["Age"],
        gender: json["Gender"],
        phoneNumber: json["PhoneNumber"],
        phoneType: json["PhoneType"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "ClientFirstName": firstName,
        "ClietLastName": lastName,
        "DateOfBirth": dateOfBirth,
        "Age": age,
        "Gender": gender,
        "PhoneNumber": phoneNumber,
        "PhoneType": phoneType,
        "Email": email,
      };
}
