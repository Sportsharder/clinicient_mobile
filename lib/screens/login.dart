import 'package:flutter/material.dart';
import '../services/securestorage_service.dart';
import 'package:flutter/services.dart';
import '../widgets/export_widgets.dart';
import '../models/export_models.dart';

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final makeBody = Container(
      //color: ThemeColors.body,
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 11, top: 4, bottom: 10),
              child: new Row(children: <Widget>[
                new Expanded(
                  flex: 20,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: TextFormField(
                      controller: _username,
                      validator: (value) {
                        if (value.toString().trim().isEmpty) {
                          return 'username is required';
                        }
                      },
                      //textInputAction: textInputAction,
                      // maxLines: maxLines,
                      //textCapitalization: capitals ? TextCapitalization.sentences : TextCapitalization.none,
                      //obscureText: obscureText,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        //filled: true,
                        //fillColor: ThemeColors.textField,

                        labelText: 'username',
                        hintText: 'username',
                        labelStyle: TextStyle(color: Colors.grey),
                        //hintStyle: TextStyle(color: Colors.blue),
                        contentPadding:
                            const EdgeInsets.only(left: 14, bottom: 5, top: 5),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11, top: 4, bottom: 0),
              child: new Row(children: <Widget>[
                new Expanded(
                  flex: 20,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(splashColor: Colors.transparent),
                    child: TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value.toString().trim().isEmpty) {
                          return 'password is required';
                        }
                      },
                      //textInputAction: textInputAction,
                      // maxLines: maxLines,
                      //textCapitalization: capitals ? TextCapitalization.sentences : TextCapitalization.none,
                      obscureText: !_showPassword,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        //filled: true,
                        //fillColor: ThemeColors.textField,

                        labelText: 'password',
                        hintText: 'password',
                        labelStyle: TextStyle(color: Colors.grey),
                        //hintStyle: TextStyle(color: Colors.blue),
                        contentPadding:
                            const EdgeInsets.only(left: 14, bottom: 5, top: 5),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: _showPassword
                        ? IconButton(
                            icon: Icon(Icons.visibility, color: Colors.orange),
                            onPressed: () {
                              setState(() {
                                _showPassword = false;
                              });
                            })
                        : IconButton(
                            icon: Icon(Icons.visibility, color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                _showPassword = true;
                              });
                            }))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: new Row(children: <Widget>[
                new Expanded(
                  child: RaisedButton(
                    child: Text('LOGIN',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Righteous',
                          fontWeight: FontWeight.w700,
                        )),
                    onPressed: () {
                      _login(context);
                    },
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );

    final makeBottom = Container(
      height: 200.0,
      child: Column(children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: new Row(children: <Widget>[
            new Expanded(
              child: RaisedButton(
                color: Color(0xffEF8D69F),
                child: Text('LOGIN',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Righteous',
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                  _login(context);
                },
              ),
            )
          ]),
        ),
      ]),
    );

    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Color(0xffEF8D69F),
        appBar: AppBar(
          title: Text('timelyPT'),
          backgroundColor: Color(0xffEF8D69F),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              child: makeBody,
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    try {
      if (_formKey.currentState.validate()) {
        Therapist test = Therapists.therapists.singleWhere(
            (therapist) => therapist.username == _username.text.toString());

        if (test == null) {
          CLSnackBar.showSnackbar(_scaffoldKey, 'invalid login', "", 2);
          return;
        }

        if (test.password != _password.text.toString()) {
          CLSnackBar.showSnackbar(_scaffoldKey, 'invalid login', "", 2);
          return;
        }
        globalState.therapist = test;
        globalState.lastSelectedDate = null;
      }



      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } catch (err) {
      CLSnackBar.showSnackbar(_scaffoldKey, 'invalid login', "", 2);
    }
  }
}


