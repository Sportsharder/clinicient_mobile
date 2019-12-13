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

  Color fontColor = Color(0xffE202E4A);

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
                  Icon(Icons.account_circle, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    (widget.appointment.patientFirstName == null
                            ? ''
                            : widget.appointment.patientFirstName) +
                        ' ' +
                        (widget.appointment.patientLastName == null
                            ? ''
                            : widget.appointment.patientLastName),
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.card_giftcard, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    widget.appointment.dateOfBirth == null
                        ? ''
                        : widget.appointment.dateOfBirth,
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                    ),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.hourglass_empty, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    widget.appointment.age == null
                        ? ''
                        : widget.appointment.age.toString(),
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                    ),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.local_pizza, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    widget.appointment.gender == null
                        ? ''
                        : widget.appointment.gender,
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                    ),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.call, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    '503-786-3645',
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                    ),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.mail_outline, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    widget.appointment.email == null
                        ? ''
                        : widget.appointment.email,
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 18,
                    ),
                  ),
                ])),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.folder_open, color: fontColor),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    widget.appointment.caseName == null
                        ? ''
                        : widget.appointment.caseName,
                    style: TextStyle(
                        color: fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
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
