// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  String note;
  String status;
  String appointmentType;
  String scheduleCase;
  String date;
  String startTime;
  String endTime;
  String therapist;
  String additionalStaff;
  String resources;

  Schedule({
    this.note,
    this.status,
    this.appointmentType,
    this.scheduleCase,
    this.date,
    this.startTime,
    this.endTime,
    this.therapist,
    this.additionalStaff,
    this.resources,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    note: json["Note"],
    status: json["Status"],
    appointmentType: json["AppointmentType"],
    scheduleCase: json["Case"],
    date: json["Date"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    therapist: json["Therapist"],
    additionalStaff: json["AdditionalStaff"],
    resources: json["Resources"],
  );

  Map<String, dynamic> toJson() => {
    "Note": note,
    "Status": status,
    "AppointmentType": appointmentType,
    "Case": scheduleCase,
    "Date": date,
    "StartTime": startTime,
    "EndTime": endTime,
    "Therapist": therapist,
    "AdditionalStaff": additionalStaff,
    "Resources": resources,
  };
}
