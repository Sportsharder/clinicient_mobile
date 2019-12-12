import 'dart:convert';

SlackingByCount slackingByCountFromJson(String str) =>
    SlackingByCount.fromJson(json.decode(str));

String slackingByCountToJson(SlackingByCount data) =>
    json.encode(data.toJson());

class SlackingByCount {
  String staffId;
  String staffFirstName;
  String staffLastName;
  String totalUnsignedVisits;

  SlackingByCount({
    this.staffId,
    this.staffFirstName,
    this.staffLastName,
    this.totalUnsignedVisits,
  });

  factory SlackingByCount.fromJson(Map<String, dynamic> json) =>
      SlackingByCount(
        staffId: json["StaffID"],
        staffFirstName: json["StaffFirstName"],
        staffLastName: json["StaffLastName"],
        totalUnsignedVisits: json["totalUnsignedVisits"],
      );

  Map<String, dynamic> toJson() => {
        "StaffID": staffId,
        "StaffFirstName": staffFirstName,
        "StaffLastName": staffLastName,
        "totalUnsignedVisits": totalUnsignedVisits,
      };
}

class SlackingByCountCollection {
  final List<SlackingByCount> slackingByCount;

  SlackingByCountCollection.fromJSON(Map<String, dynamic> json)
      : slackingByCount = (json['recordset'] as List)
            .map((json) => SlackingByCount.fromJson(json))
            .toList();
}
