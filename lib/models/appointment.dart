// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';
import 'patient.dart';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  int apptID;
  int staffID;
  //Patient patient;
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

  String staffFirstName;
  String staffLastName;

  String patientFirstName;
  String patientLastName;
  String dateOfBirth;
  int age;
  String gender;
  String phoneNumber;
  String phoneType;
  String email;

  Appointment({
    this.apptID,
    this.staffID,
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
    this.staffFirstName,
    this.staffLastName,
    this.patientFirstName,
    this.patientLastName,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.phoneNumber,
    this.phoneType,
    this.email,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        //patient: Patient.fromJson(json["patient"]),
        apptID: json["ApptID"],
        staffID: json["StaffID"],
        //patient: Patient.fromJson(json),
        note: json["Note"],
        status: json["Status"],
        appointmentType: json["AppointmentType"],
        caseName: json["CaseName"],
        apptStartTime: json["ApptStartTime"] == null
            ? null
            : DateTime.parse(json["ApptStartTime"]).toLocal(),
        startDate: json["ApptStartTime"] == null
            ? null
            : DateFormat.yMMMd()
                .format(DateTime.parse(json["ApptStartTime"]).toLocal()),
        startTime: json["ApptStartTime"] == null
            ? null
            : DateFormat.jm()
                .format(DateTime.parse(json["ApptStartTime"]).toLocal()),
        endTime: json["EndTime"],
        therapist: json["Therapist"],
        additionalStaff: json["AdditionalStaff"],
        resources: json["Resources"],
        duration: json["ApptLength"],
        staffFirstName: json["StaffFirstName"],
        staffLastName: json["StaffLastName"],
        patientFirstName: json["ClientFirstName"],
        patientLastName: json["ClientLastName"],
        dateOfBirth: json["DateOfBirth"],
        age: json["Age"],
        gender: json["Gender"],
        phoneNumber: json["PhoneNumber"],
        phoneType: json["PhoneType"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        'ApptID': apptID,
        'StaffID': staffID,
        // 'patient': patient.toJson(),
        "Note": note,
        "Status": status,
        "AppointmentType": appointmentType,
        "CaseName": caseName,
        "ApptStartTime":
            apptStartTime == null ? null : apptStartTime.toUtc().toString(),
        "StartDate": startDate,
        "StartTime": startTime,
        "EndTime": endTime,
        "Therapist": therapist,
        "AdditionalStaff": additionalStaff,
        "Resources": resources,
        "ApptLength": duration,
        "StaffFirstName": staffFirstName,
        "StaffLastName": staffLastName,

        "ClientFirstName": patientFirstName,
        "ClietLastName": patientLastName,
        "DateOfBirth": dateOfBirth,
        "Age": age,
        "Gender": gender,
        "PhoneNumber": phoneNumber,
        "PhoneType": phoneType,
        "Email": email,
      };
}

class AppointmentCollection {
  final List<Appointment> appointments;

  AppointmentCollection.fromJSON(Map<String, dynamic> json)
      : appointments = (json['recordset'] as List)
            .map((json) => Appointment.fromJson(json))
            .toList();
}
