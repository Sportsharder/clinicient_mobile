import 'package:flutter/material.dart';

class GamificationOther extends StatefulWidget {
  GamificationOther({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title = "Other yay!!";
  @override
  _GamificationSignoffState createState() => _GamificationSignoffState();
}

class _GamificationSignoffState extends State<GamificationOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Other cool gamification metric!!!  Go, Kelsey!!',
            ),
          ],
        ),
      ),
    );
  }
}
