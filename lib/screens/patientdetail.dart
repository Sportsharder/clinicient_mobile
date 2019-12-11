import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  PatientDetails({Key key}) : super(key: key);

  String title = "Patient & Case Details";
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
