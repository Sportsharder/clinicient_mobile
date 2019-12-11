import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/export_models.dart';
import '../constants/urls.dart';
import 'dart:io';

class DeviceService {
  static Future updateFireToken(String fireToken) async {

    return;
    Map map;
    String url;

    url = "";

    map = {
      //'apikey':
      //if (Platform.isAndroid)
      //'deviceID': 'com.google.android.gms.tasks.zzu@56c9ed5',
      'deviceToken': (fireToken == null ? '' : fireToken),
      'platform': Platform.isAndroid ? 'android' : 'iOS',
    };

    print(url);

    final response =
        await http.post(url, headers: {'Authorization': ''}, body: map);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      print(jsonResponse);
    } else {
      print(response.statusCode);
      // If that call was not successful, throw an error.
      //throw Exception('Invalid username or password');
    }
  }
}
