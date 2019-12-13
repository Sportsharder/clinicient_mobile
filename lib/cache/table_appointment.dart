import 'dart:async';
import 'database_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/export_models.dart';
import 'dart:convert';

class TableAppointmentCache {
  static final String tableName = 'appointment';
  static final String pk = "pk";
  static final String apptID = "ApptID";
  static final String staffID = "StaffID";
  static final String note = "Note";
  static final String status = "Status";
  static final String appointmentType = "AppointmentType";
  static final String caseName = "CaseName";
  static final String apptStartTime = "ApptStartTime";
  static final String startDate = "StartDate";
  static final String startTime = "StartTime";
  static final String endTime = "EndTime";
  static final String therapist = "Therapist";
  static final String additionalStaff = "AdditionalStaff";
  static final String resources = "Resources";
  static final String apptLength = "ApptLength";
  static final String staffFirstName = "StaffFirstName";
  static final String staffLastName = "StaffLastName";
  static final String patientFirstName = "ClientFirstName";
  static final String patientLastName = "ClietLastName";
  static final String dateOfBirth = "DateOfBirth";
  static final String age = "Age";
  static final String gender = "Gender";
  static final String phoneNumber = "PhoneNumber";
  static final String phoneType = "PhoneType";
  static final String email = "Email";

  static final String columns = "CREATE TABLE $tableName ("
      "$pk INTEGER PRIMARY KEY,"
      "$apptID INTEGER,"
      "$staffID INTEGER,"
      "$note TEXT,"
      "$status TEXT,"
      "$appointmentType TEXT,"
      "$caseName TEXT,"
      "$apptStartTime TEXT,"
      "$startDate TEXT,"
      "$startTime TEXT,"
      "$endTime TEXT,"
      "$therapist TEXT,"
      "$additionalStaff TEXT,"
      "$resources TEXT,"
      "$apptLength INT,"
      "$staffFirstName TEXT,"
      "$staffLastName TEXT,"
      "$patientFirstName TEXT,"
      "$patientLastName TEXT,"
      "$dateOfBirth TEXT,"
      "$age INT,"
      "$gender TEXT,"
      "$phoneNumber TEXT,"
      "$phoneType TEXT,"
      "$email TEXT)";

  static Database _database;

  TableAppointmentCache._();

  static Future<Appointment> upsert(Appointment appointment) async {
    _database = await DatabaseProvider.db.database;

    try {
      var count = Sqflite.firstIntValue(await _database.rawQuery(
          'SELECT COUNT(*) FROM $tableName WHERE $apptID = ?',
          [appointment.apptID]));

      if (count == 0) {
        await _database.insert(tableName, appointment.toJson());
      } else {
        Map<String, dynamic> map = appointment.toJson();

        await _database.update(tableName, map,
            where: "$apptID = ?", whereArgs: [appointment.apptID]);
      }
    } catch (error) {
      print(error);
      throw (error);
    }

    return appointment;
  }

  static Future<List<Appointment>> readByTherapist(int therapistID) async {
    _database = await DatabaseProvider.db.database;

    List<Map> results = await _database.query(
      tableName,
      columns: [
        pk,
        apptID,
        staffID,
        status,
        appointmentType,
        caseName,
        apptStartTime,
        startDate,
        startTime,
        endTime,
        therapist,
        additionalStaff,
        resources,
        apptLength,
        staffFirstName,
        staffLastName,
        patientFirstName,
        patientLastName,
        dateOfBirth,
        age,
        gender,
        phoneNumber,
        phoneType,
        email,
      ],
      where: "$staffID = ? ",
      whereArgs: [therapistID],
    );

    List<Appointment> collection = new List();
    results.forEach((result) {
      Appointment individual = Appointment.fromJson(result);
      collection.add(individual);
    });

    return collection;
  }
}
