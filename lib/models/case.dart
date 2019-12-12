// To parse this JSON data, do
//
//     final case = caseFromJson(jsonString);

import 'dart:convert';

Case caseFromJson(String str) => Case.fromJson(json.decode(str));

String caseToJson(Case data) => json.encode(data.toJson());

class Case {
  String caseName;
  String referringProvider;
  String dateOfOnset;
  String authorizedToReceivePayment;

  Case({
    this.caseName,
    this.referringProvider,
    this.dateOfOnset,
    this.authorizedToReceivePayment,
  });

  factory Case.fromJson(Map<String, dynamic> json) => Case(
    caseName: json["CaseName"],
    referringProvider: json["ReferringProvider"],
    dateOfOnset: json["DateOfOnset"],
    authorizedToReceivePayment: json["AuthorizedToReceivePayment"],
  );

  Map<String, dynamic> toJson() => {
    "CaseName": caseName,
    "ReferringProvider": referringProvider,
    "DateOfOnset": dateOfOnset,
    "AuthorizedToReceivePayment": authorizedToReceivePayment,
  };
}
