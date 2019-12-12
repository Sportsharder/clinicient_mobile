import 'package:flutter/material.dart';
import '../blocs/gamification_bloc.dart';
import '../models/export_models.dart';

class GamificationSignoffWeek extends StatefulWidget {
  GamificationSignoffWeek({Key key}) : super(key: key);

  String title = "Gamification signoff!!";
  @override
  _GamificationSignoffState createState() => _GamificationSignoffState();
}

class _GamificationSignoffState extends State<GamificationSignoffWeek> {
  ScrollController _scrollController = new ScrollController();
  GamificationBloc _gamificationBloc = GamificationBloc();

  List _scores;

  @override
  void initState() {
    super.initState();

    _gamificationBloc.signoffLeaderboardRefreshed.listen((results) {
      if (mounted) {
        setState(() {
          _scores = results;
        });
      }
    }, onError: (err) {
      print("error $err");
    }, cancelOnError: false);

    _gamificationBloc.refreshSignoffLeaderboard('Week');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        _scores == null
            ? Container()
            : Expanded(
                //height: 100,
                //width: 200,
                child: SingleChildScrollView(
                    child: Container(
                        // color: Colors.black,
                        // padding: const EdgeInsets.only(
                        //     left: 0, right: 0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: _scores.length,
                            itemBuilder: (BuildContext context, int index) {
                              SignedVisit currentRow = _scores[index];

                              return Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: CircleAvatar(
                                            child: Text((index+1).toString()),
                                            backgroundColor: Color(0xffEF8D69F),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                              _getTherapistImage(
                                                  currentRow.staffFirstName),
                                              //fit: BoxFit.fill,
                                              //height: 40,
                                              width: 65,
                                              height: 50,
                                              fit: BoxFit.fitWidth),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                        ),
                                        Expanded(
                                          child: Text(
                                            currentRow.staffFirstName,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                        ),
                                        Expanded(
                                          child: Text(
                                            currentRow.staffLastName,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                        ),
                                        Expanded(
                                          child: Text(
                                            currentRow.signedVisits.toString(),
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ]));
                            }))))
      ])
    ])));
  }

  String _getTherapistImage(String firstName) {
    String retValue;

    switch (firstName) {
      case 'Marianne':
        {
          retValue = 'assets/marianne.jpg';
          break;
        }
      case 'Kent':
        {
          retValue = 'assets/kentrowe.jpg';
          break;
        }
      case 'John':
        {
          retValue = 'assets/johnmcneil.jpg';
          break;
        }
      case 'Stevie':
        {
          retValue = 'assets/stevie.png';
          break;
        }
      case 'Roland':
        {
          retValue = 'assets/roland.png';
          break;
        }
      case 'Mutt':
        {
          retValue = 'assets/mutt.png';
          break;
        }
      case 'Ted':
        {
          retValue = 'assets/ted.png';
          break;
        }
      case 'Twila':
        {
          retValue = 'assets/twila.png';
          break;
        }
      default:
        {
          retValue = 'assets/spongesil.png';
          break;
        }
    }

    return retValue;
  }
}

/*


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
*/
