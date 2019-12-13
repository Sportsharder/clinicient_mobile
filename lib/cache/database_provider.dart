import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'table_appointment.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "timelypt.db");

    print(path);

    _database = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // When creating the db, create the tables
      await db.execute(TableAppointmentCache.columns);

      //await TableFurnace.insertForge(db);
    });
  }

  Future<Database> get database async {
    if (_database != null) {
      //print("ALREADY INITIALIZED********************");
      return _database;
    } else {
      // if _database is null we instantiate it
      await _initDB();
      //print("INITIALIZING********************");
      return _database;
    }
  }

  clearDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "timelypt.db");

      //await TableAppointmentCache.deleteAll();

    } catch (err) {
      print("clearDatabase - " + err.toString());
    }
  }

/*
  clearDatabase() async {
    try {

     // if (_database.isOpen)
       // _database.close();

      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "ironcircles.db");

      await deleteDatabase(path);

      //_database = null;

      _database = await _initDB();
    } catch (err) {
      print("clearDatabase - " + err.toString());
    }
  }
  */
}
