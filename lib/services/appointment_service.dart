import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/export_models.dart';
import '../constants/urls.dart';


class AppointmentService {
  Future refreshSchedule(String therapistID) async {
    String url =
        Urls().SERVER + Urls.APPOINTMENT; //+circleID + '?' + memberID;

    print(url);

    final response = await http.get(
      url,
      headers: {
        'apikey': Urls.APIKEY,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      return;
    } else {
      print(response.statusCode.toString() + ": " + response.body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      throw Exception(jsonResponse['msg']);
    }
  }

}
