// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';
import 'patient.dart';

Appointment appointmentFromJson(String str) => Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Patient patient;
  String note;
  String status;
  String appointmentType;
  String caseName;

  DateTime apptStartTime;
  String startDate;
  String startTime;
  String endTime;

  String therapist;
  String additionalStaff;
  String resources;
  int duration;

  Appointment({
    this.patient,
    this.note,
    this.status,
    this.appointmentType,
    this.caseName,
    this.apptStartTime,
    this.startDate,
    this.startTime,
    this.endTime,
    this.therapist,
    this.additionalStaff,
    this.resources,
    this.duration,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        //patient: Patient.fromJson(json["patient"]),
        patient: Patient.fromJson(json),
        note: json["Note"],
        status: json["Status"],
        appointmentType: json["AppointmentType"],
        caseName: json["CaseName"],
        apptStartTime: json["ApptStartTime"] == null
            ? null
            : DateTime.parse(json["ApptStartTime"]).toLocal(),

        // date:  "Date": date == null ? null : date.toUtc().toString(),

  //  DateFormat.yMMMd().format(DateTime.parse(created.toString()));

        startDate: json["ApptStartTime"] == null
            ? null
            : DateFormat.yMMMd()
            .format(DateTime.parse(json["ApptStartTime"]).toLocal()),
        startTime: json["StartTime"],
        endTime: json["EndTime"],
        therapist: json["Therapist"],
        additionalStaff: json["AdditionalStaff"],
        resources: json["Resources"],
        duration: json["ApptLength"],
      );

  Map<String, dynamic> toJson() => {
        'patient': patient.toJson(),
        "Note": note,
        "Status": status,
        "AppointmentType": appointmentType,
        "Case": caseName,
        "ApptStartTime":
            apptStartTime == null ? null : apptStartTime.toUtc().toString(),
        "StartDate": startDate,
        "StartTime": startTime,
        "EndTime": endTime,
        "Therapist": therapist,
        "AdditionalStaff": additionalStaff,
        "Resources": resources,
        "ApptLength": duration,
      };
}

class AppointmentCollection {
  final List<Appointment> appointments;

  AppointmentCollection.fromJSON(Map<String, dynamic> json)
      : appointments = (json['recordset'] as List)
      .map((json) => Appointment.fromJson(json))
      .toList();
}
