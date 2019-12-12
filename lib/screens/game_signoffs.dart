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
              Padding(
                padding: EdgeInsets.only(
                  left: 50,
                  top: 20,
                  bottom: 20,
                  right: 50,
                ),
                child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('1'),
                        backgroundColor: Color(0xffEF8D69F),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Image.asset('assets/stevie.png',
                          //fit: BoxFit.fill,
                          //height: 40,
                          width: 65,
                          fit: BoxFit.fitWidth),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Text(
                        'Stevie',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Text(
                        '1000',
                        style: TextStyle(fontSize: 18),
                      ),
                    ]),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
                child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        child: Text('2'),
                        backgroundColor: Color(0xffEF8D69F),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Image.asset('assets/twila.png',
                          //fit: BoxFit.fill,
                          //height: 40,
                          width: 65,
                          fit: BoxFit.fitWidth),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Text('Twi', style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Text('1', style: TextStyle(fontSize: 18)),

                    ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
