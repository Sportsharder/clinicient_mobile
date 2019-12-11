import 'package:flutter/material.dart';
import '../screens/calendar.dart';
import '../screens/gamification.dart';
import 'dart:io';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer();

  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.teal, splashColor: Colors.white),
        child: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            width: 200.0,
                            height: 115.0,
                            child: InkWell(
                                child: Image.asset('assets/logo_reversed.png',
                                    //fit: BoxFit.fill,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fitWidth),
                                //backgroundColor: ThemeColors.primaryColor,

                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Calendar()),
                                      (Route<dynamic> route) => false);
                                })),
                        /* SizedBox(
                        width: 28.0,
                        height: 50.0,
                        child: Text("Iron /n Circles",
                            style: TextStyle(color: Colors.white)),
                      ),
                      CircleAvatar(child: Image.asset('assets/icon.png')),*/
                      ], // alignment: FractionalOffset.topLeft,
                    ),
                  ],
                ),
                decoration: new BoxDecoration(color: Colors.teal),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.calendar_today, color: Colors.white),
                title: Text(
                  'Schedule',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calendar()),
                          (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.videogame_asset, color: Colors.white),
                title: Text(
                  'Gamification',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Gamification()),
                          (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ));
    //  body: _getDrawerItemScreen(_selectedIndex),
  }
}
