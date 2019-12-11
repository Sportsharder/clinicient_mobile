import 'package:flutter/material.dart';
import '../screens/calendar.dart';
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
                            width: 115.0,
                            height: 115.0,
                            child: InkWell(
                                child: ClipOval(
                                    child: Image.asset('assets/icon.png',
                                        //fit: BoxFit.fill,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover)
                                    //backgroundColor: ThemeColors.primaryColor,
                                    ),
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
            ],
          ),
        ));
    //  body: _getDrawerItemScreen(_selectedIndex),
  }
}
