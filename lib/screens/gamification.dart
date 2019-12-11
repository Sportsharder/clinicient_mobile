import 'package:flutter/material.dart';
import '../widgets/navigationdrawer.dart';
import '../models/export_models.dart';
import 'calendar.dart';
import 'game_signoffs.dart';

class TAB {
  static const int DETAIL = 0;
  static const int AVATAR = 1;
  static const int HEALTH = 2;
}

class Gamification extends StatelessWidget {
 // final UserFurnace userFurnace;
  final int tab;

  // FlutterManager({Key key, this.title}) : super(key: key);
  Gamification({Key key, this.tab = 0,}) : super(key: key);
  // final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: tab,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.teal,
            tabs: [
              Text('Sign Offs',
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              Text('Appts',
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              Text('Other!!',
                  style: TextStyle(color: Colors.white, fontSize: 18.0)),
              // Text('FLUTTERIN', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              //Tab(icon: Icon(Icons.directions_car)),
              //Tab(icon: Icon(Icons.directions_transit)),
              //  Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text('Furnace'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Calendar(),
                    ),
                    ModalRoute.withName("/home"));
              },
            )
          ],
        ),
        //drawer: NavigationDrawer(),
        body: TabBarView(
          children: [
            GamificationSignoff(),
            GamificationSignoff(),
            GamificationSignoff(),

            // FlutteringSettings()
          ],
        ),
      ),
    );
  }
}
