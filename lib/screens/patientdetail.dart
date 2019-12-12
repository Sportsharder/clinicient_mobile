import 'package:flutter/material.dart';
import 'calendar.dart';
import '../models/export_models.dart';

class PatientDetail extends StatefulWidget {
  //PatientDetail({Key key, this.appointment}) : super(key: key);

  final String title = "Patient & Case Details";
  final Appointment appointment;

  PatientDetail(this.appointment);

  @override
  _PatientDetailsState createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Column makeBody = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Image.asset('assets/alexis.png',
              //fit: BoxFit.fill,
              // height: 40,
              //   width: 40,
              fit: BoxFit.fitWidth),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.appointment.patient.firstName +
                        ' ' +
                        widget.appointment.patient.lastName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '03/29/1987' + '      ' + '32',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '503-786-3645',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'alexis@theroses.com',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.appointment.caseName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'I need notes, Serhat',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  /*Text(
                    widget.appointment.patient.dateOfBirth +
                        ' ' +
                        widget.appointment.patient.dateOfBirth,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),*/
                ])),
      ],
    );

    return WillPopScope(
        onWillPop: () => _goHome(),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Patient Details'),
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
