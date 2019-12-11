import 'package:flutter/material.dart';


class GamificationAppointments extends StatefulWidget {
  GamificationAppointments({Key key}) : super(key: key);


  String title = "Appointments";

  @override
  _GamificationSignoffState createState() => _GamificationSignoffState();
}

class _GamificationSignoffState extends State<GamificationAppointments> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Appointment metrics',
            ),

          ],
        ),
      ),
    );
  }
}