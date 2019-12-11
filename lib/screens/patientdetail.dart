import 'package:flutter/material.dart';
import 'calendar.dart';

class PatientDetail extends StatefulWidget {
  PatientDetail({Key key}) : super(key: key);

  String title = "Patient & Case Details";
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _goHome(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Patient Details',
                ),
              ],
            ),
          ),
        ));
  }

  _goHome() {

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Calendar()),
        (Route<dynamic> route) => false);
  }
}
