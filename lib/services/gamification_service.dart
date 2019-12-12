import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/export_models.dart';
import '../constants/urls.dart';

class GamificationService {
  Future<List<SlackingByCount>> refreshSlackerBoardByCount() async {
    String url = Urls().SERVER + Urls.GAMIFICATIONSLACK + 'ByCount';

    print(url);

    final response = await http.get(
      url,
      headers: {
        'apikey': Urls.APIKEY,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

     // List test = jsonResponse['recordset'] as List;

      SlackingByCountCollection slackingByCount =
          SlackingByCountCollection.fromJSON(jsonResponse);

      return slackingByCount.slackingByCount;
    } else {
      print(response.statusCode.toString() + ": " + response.body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      throw Exception(jsonResponse['msg']);
    }
  }

  Future<List<SlackingByTime>> refreshSlackerBoardByTime() async {
    String url = Urls().SERVER + Urls.GAMIFICATIONSLACK + 'ByTime';

    print(url);

    final response = await http.get(
      url,
      headers: {
        'apikey': Urls.APIKEY,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      List test = jsonResponse['recordset'] as List;

      SlackingByTimeCollection slackingByTime =
          SlackingByTimeCollection.fromJSON(jsonResponse);

      return slackingByTime.slackingByTime;
    } else {
      print(response.statusCode.toString() + ": " + response.body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      throw Exception(jsonResponse['msg']);
    }
  }

  Future<List<SignedVisit>> refreshSignoffLeaderboard(String filter) async {
    String url = Urls().SERVER +
        Urls.GAMIFICATIONSIGNOFF +
        filter; //+ therapistID.toString(); //+circleID + '?' + memberID;

    print(url);

    final response = await http.get(
      url,
      headers: {
        'apikey': Urls.APIKEY,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Appointment appointment = Appointment.fromJson(jsonResponse);

      //   Map<String, dynamic> jsonSubset = jsonResponse[0];

      List test = jsonResponse['recordset'] as List;

      SignedVisitCollection signedVisits =
          SignedVisitCollection.fromJSON(jsonResponse);

      return signedVisits.signedVisits;
    } else {
      print(response.statusCode.toString() + ": " + response.body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      throw Exception(jsonResponse['msg']);
    }
  }
}
