import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'questbrain.dart';
import 'scorer.dart';

Questbrain questbrain = Questbrain();

void main() => runApp(Quizbee());

class Quizbee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //int qno = 0;
  Scorer sca = Scorer(questbrain.totalques());
  List<Icon> scorekeeper = [];

  void cleansk() {
    scorekeeper.clear();
  }

  void checkans(bool userans) {
    setState(() {
      if (userans == questbrain.getquesans()) {
        {
          sca.ca();
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
        }
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.red));
      }
      if (questbrain.isFinished() == true) {
        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
        cleansk();
        //double ans = sc.perscore();
        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: sca.perscore(),
        ).show();
        questbrain.reset();
        sca.reset();
      } else {
        questbrain.nextquestion();
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questbrain.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkans(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkans(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
