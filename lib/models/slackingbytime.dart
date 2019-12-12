// To parse this JSON data, do
//
//     final slackingByTime = slackingByTimeFromJson(jsonString);

import 'dart:convert';

SlackingByTime slackingByTimeFromJson(String str) =>
    SlackingByTime.fromJson(json.decode(str));

String slackingByTimeToJson(SlackingByTime data) => json.encode(data.toJson());

class SlackingByTime {
  int staffId;
  String staffFirstName;
  String staffLastName;
  int totalSlackingTimeinHours;

  SlackingByTime({
    this.staffId,
    this.staffFirstName,
    this.staffLastName,
    this.totalSlackingTimeinHours,
  });

  factory SlackingByTime.fromJson(Map<String, dynamic> json) => SlackingByTime(
        staffId: json["StaffID"],
        staffFirstName: json["StaffFirstName"],
        staffLastName: json["StaffLastName"],
        totalSlackingTimeinHours: json["totalSlackingTimeinHours"],
      );

  Map<String, dynamic> toJson() => {
        "StaffID": staffId,
        "StaffFirstName": staffFirstName,
        "StaffLastName": staffLastName,
        "totalSlackingTimeinHours": totalSlackingTimeinHours,
      };
}

class SlackingByTimeCollection {
  final List<SlackingByTime> slackingByTime;

  SlackingByTimeCollection.fromJSON(Map<String, dynamic> json)
      : slackingByTime = (json['recordset'] as List)
            .map((json) => SlackingByTime.fromJson(json))
            .toList();
}
