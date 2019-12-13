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
          child: Image.asset(_getPatientImage(),
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
                    (widget.appointment.patientFirstName == null
                            ? ''
                            : widget.appointment.patientFirstName) +
                        ' ' +
                        (widget.appointment.patientLastName == null
                            ? ''
                            : widget.appointment.patientLastName),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.appointment.dateOfBirth == null
                        ? ''
                        : widget.appointment.dateOfBirth +
                            '      ' +
                            (widget.appointment.age == null
                                ? ''
                                : widget.appointment.age.toString()),
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
                  // Icon(Icons. ),
                  Text(
                    widget.appointment.gender == null
                        ? ''
                        : widget.appointment.gender,
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
                    widget.appointment.email == null
                        ? ''
                        : widget.appointment.email,
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
                    widget.appointment.caseName == null
                        ? ''
                        : widget.appointment.caseName,
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
            backgroundColor: Color(0xffEF8D69F),
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

  String _getPatientImage() {
    String retValue;

    switch (widget.appointment.patientFirstName) {
      case 'Alexis':
        {
          retValue = 'assets/alexis.png';
          break;
        }
      case 'Stevie':
        {
          retValue = 'assets/stevie.png';
          break;
        }
      case 'Moira':
        {
          retValue = 'assets/moira.png';
          break;
        }
      case 'Roland':
        {
          retValue = 'assets/roland.png';
          break;
        }
      case 'Mutt':
        {
          retValue = 'assets/mutt.png';
          break;
        }
      case 'John':
        {
          retValue = 'assets/johnny.png';
          break;
        }
      case 'Ted':
        {
          retValue = 'assets/ted.png';
          break;
        }
      case 'David':
        {
          retValue = 'assets/david.png';
          break;
        }
      case 'Twila':
        {
          retValue = 'assets/twila.png';
          break;
        }
      default:
        {
          retValue = 'assets/spongesil.png';
          break;
        }
    }

    return retValue;
  }
}
