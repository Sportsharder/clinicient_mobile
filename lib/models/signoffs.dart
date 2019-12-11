// To parse this JSON data, do
//
//     final signoffs = signoffsFromJson(jsonString);

import 'dart:convert';

Signoffs signoffsFromJson(String str) => Signoffs.fromJson(json.decode(str));

String signoffsToJson(Signoffs data) => json.encode(data.toJson());

class Signoffs {
  String therapist;
  String clinic;
  String signoffCount;
  String rank;

  Signoffs({
    this.therapist,
    this.clinic,
    this.signoffCount,
    this.rank,
  });

  factory Signoffs.fromJson(Map<String, dynamic> json) => Signoffs(
    therapist: json["Therapist"],
    clinic: json["Clinic"],
    signoffCount: json["SignoffCount"],
    rank: json["Rank"],
  );

  Map<String, dynamic> toJson() => {
    "Therapist": therapist,
    "Clinic": clinic,
    "SignoffCount": signoffCount,
    "Rank": rank,
  };
}
