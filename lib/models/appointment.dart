// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';
import 'patient.dart';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Patient patient;
  String note;
  String status;
  String appointmentType;
  String scheduleCase;
  DateTime date;
  String stringDate;
  String startTime;
  String endTime;
  String therapist;
  String additionalStaff;
  String resources;

  Schedule({
    this.patient,
    this.note,
    this.status,
    this.appointmentType,
    this.scheduleCase,
    this.date,
    this.stringDate,
    this.startTime,
    this.endTime,
    this.therapist,
    this.additionalStaff,
    this.resources,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        patient: Patient.fromJson(json["patient"]),
        note: json["Note"],
        status: json["Status"],
        appointmentType: json["AppointmentType"],
        scheduleCase: json["Case"],
        date: json["date"] == null
            ? null
            : DateTime.parse(json["date"]).toLocal(),

        // date:  "Date": date == null ? null : date.toUtc().toString(),
        stringDate: json["StringDate"],
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        therapist: json["Therapist"],
        additionalStaff: json["AdditionalStaff"],
        resources: json["Resources"],
      );

  Map<String, dynamic> toJson() => {
        'patient': patient.toJson(),
        "Note": note,
        "Status": status,
        "AppointmentType": appointmentType,
        "Case": scheduleCase,
        "Date": date == null ? null : date.toUtc().toString(),
        "StringDate": stringDate,
        "StartTime": startTime,
        "EndTime": endTime,
        "Therapist": therapist,
        "AdditionalStaff": additionalStaff,
        "Resources": resources,
      };
}
