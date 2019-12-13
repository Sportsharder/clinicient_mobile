import 'package:flutter/material.dart';
import '../blocs/gamification_bloc.dart';
import '../models/export_models.dart';
import '../widgets/export_widgets.dart';

class SlackerBoardByTime extends StatefulWidget {
  SlackerBoardByTime({Key key}) : super(key: key);

  String title = "Gamification signoff!!";
  @override
  _SlackerBoardByTimeState createState() => _SlackerBoardByTimeState();
}

class _SlackerBoardByTimeState extends State<SlackerBoardByTime> {
  ScrollController _scrollController = new ScrollController();
  GamificationBloc _gamificationBloc = GamificationBloc();

  List _scores;

  @override
  void initState() {
    super.initState();

    _gamificationBloc.slackingByTimeRefreshed.listen((results) {
      if (mounted) {
        setState(() {
          _scores = results;
        });
      }
    }, onError: (err) {
      print("error $err");
    }, cancelOnError: false);

    _gamificationBloc.refreshSlackingByTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _scores == null
            ? Container()
            : SingleChildScrollView(
                child: Column(children: <Widget>[
                // color: Colors.black,
                // padding: const EdgeInsets.only(
                //     left: 0, right: 0),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: _scores.length,
                    itemBuilder: (BuildContext context, int index) {
                      SlackingByTime currentRow = _scores[index];

                      return SlackerBoardByTimeWidget(currentRow, index);
                    })
              ])));
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
