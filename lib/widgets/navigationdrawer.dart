import 'package:flutter/material.dart';
import '../screens/calendar.dart';
import '../screens/gamification.dart';
import '../screens/slackerboard.dart';
import 'dart:io';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer();

  Color _menuItems = Colors.grey;

  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color(0xffEfdf4e9), splashColor: Colors.white),
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
                decoration: new BoxDecoration(color: Color(0xffEF8D69F)),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.calendar_today, color: _menuItems),
                title: Text(
                  'Schedule',
                  style: TextStyle(color: _menuItems),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Calendar()),
                      (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.videogame_asset, color: _menuItems),
                title: Text(
                  'Sign Off Leaderboard',
                  style: TextStyle(
                    color: _menuItems, /*fontWeight: FontWeight.bold*/
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Gamification()),
                          (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.mood_bad, color: _menuItems),
                title: Text(
                  'Unsigned Visit Slackerboard',
                  style: TextStyle(
                    color: _menuItems, /*fontWeight: FontWeight.bold*/
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Slackerboard()),
                          (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 25),
                leading: Icon(Icons.lock, color: _menuItems),
                title: Text(
                  'Logout',
                  style: TextStyle(color: _menuItems),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Gamification()),
                      (Route<dynamic> route) => false);
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 180),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/grayheads.png',
                            width: 100, fit: BoxFit.fitWidth),
                      ])),
            ],
          ),
        ));
    //  body: _getDrawerItemScreen(_selectedIndex),
  }
}
