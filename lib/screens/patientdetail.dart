import 'package:flutter/material.dart';
import 'calendar.dart';
import '../models/export_models.dart';

class PatientDetail extends StatefulWidget {
  PatientDetail({Key key}) : super(key: key);

  String title = "Patient & Case Details";
  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetail> {

  Patient patient = Patient(firstName: 'Serhat', lastName: 'Ozcanli', dateOfBirth: '12/18/1976', );

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Column makeBody = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        'Patient Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _goHome(),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.teal,
          ),
          body: makeBody,
        ));
  }

  _goHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Calendar()),
        (Route<dynamic> route) => false);
  }
}
