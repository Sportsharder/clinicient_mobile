// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignedVisit welcomeFromJson(String str) =>
    SignedVisit.fromJson(json.decode(str));

String welcomeToJson(SignedVisit data) => json.encode(data.toJson());

class SignedVisit {
  int staffId;
  String staffFirstName;
  String staffLastName;
  int signedVisits;

  SignedVisit({
    this.staffId,
    this.staffFirstName,
    this.staffLastName,
    this.signedVisits,
  });

  factory SignedVisit.fromJson(Map<String, dynamic> json) => SignedVisit(
        staffId: json["StaffID"],
        staffFirstName: json["StaffFirstName"],
        staffLastName: json["StaffLastName"],
        signedVisits: json["SignedVisits"],
      );

  Map<String, dynamic> toJson() => {
        "StaffID": staffId,
        "StaffFirstName": staffFirstName,
        "StaffLastName": staffLastName,
        "SignedVisits": signedVisits,
      };
}

class SignedVisitCollection {
  final List<SignedVisit> signedVisits;

  SignedVisitCollection.fromJSON(Map<String, dynamic> json)
      : signedVisits = (json['recordset'] as List)
            .map((json) => SignedVisit.fromJson(json))
            .toList();
}
