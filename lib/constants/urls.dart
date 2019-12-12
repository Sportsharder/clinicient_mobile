import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class Urls {
  String SERVER;

  static const String APIKEY = 'J73Hpqj362J4psX7jyhXdftbxSPYkE9CrjWShz9r';
  static const String PATIENT = 'patient/';
  static const String APPOINTMENT = 'appointment/';
  //static const String GAMIFICATION = 'gamification/';
  static const String GAMIFICATIONSIGNOFF = 'gamification/signedvisits/';
  static const String GAMIFICATIONSLACK = 'gamification/unsigned/';

  Urls() {
    if (kReleaseMode) {
      SERVER = 'https://insightmobileapi.herokuapp.com/';
    } else {

      if (Platform.isAndroid) {
        SERVER = "http://10.0.2.2:3001/";
      } else if (Platform.isIOS) {
        // iOS-specific code
        SERVER = "http://localhost:3001/";
      }
    }
  }
}

final urls = Urls();