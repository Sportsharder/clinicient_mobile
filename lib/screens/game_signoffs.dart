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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Expanded(
                child: CircleAvatar(
                  child: Text('1'),
                  backgroundColor: Color(0xffEF8D69F),
                ),
              ),
              Expanded(
                child: Image.asset('assets/stevie.png',
                    //fit: BoxFit.fill,
                    //height: 40,
                    width: 65,
                    fit: BoxFit.fitWidth),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Expanded(
                child: Text(
                  'Stevie',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              Expanded(
                child: Text(
                  '1000',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      child: Text('1'),
                      backgroundColor: Color(0xffEF8D69F),
                    ),
                  ),
                  Expanded(
                    child: Image.asset('assets/stevie.png',
                        //fit: BoxFit.fill,
                        //height: 40,
                        width: 65,
                        fit: BoxFit.fitWidth),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Expanded(
                    child: Text(
                      'Stie',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Expanded(
                    child: Text(
                      '00',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
