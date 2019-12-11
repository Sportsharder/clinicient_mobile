import 'package:flutter/material.dart';

class GamificationSignoff extends StatefulWidget {
  GamificationSignoff({Key key}) : super(key: key);

  String title = "Gamification signoff!!";
  @override
  _GamificationSignoffState createState() => _GamificationSignoffState();
}

class _GamificationSignoffState extends State<GamificationSignoff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Signoff metrics, yay!!!',
            ),
          ],
        ),
      ),
    );
  }
}
