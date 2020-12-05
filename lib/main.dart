import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';
import 'core.dart';

Core core = Core();

void main() => runApp(Gamizz());

class Gamizz extends StatelessWidget {
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
  List<Icon> scoreKeeper = [];
  int scoreCorrect = 0;
  int scoreIncorrect = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = core.getItemAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        final player = AudioCache();
        player.play('right.mp3');
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        scoreCorrect++;
      } else {
        final player = AudioCache();
        player.play('wrong.mp3');
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        scoreIncorrect++;
      }
      core.nextItem();
      if (core.isFinished() == true) {
        Alert(
          style: AlertStyle(
            backgroundColor: Colors.black,
            titleStyle: TextStyle(
                color: scoreCorrect > scoreIncorrect
                    ? Colors.lightGreenAccent
                    : Colors.red),
            descStyle: TextStyle(
                color: scoreCorrect > scoreIncorrect
                    ? Colors.lightGreen
                    : Colors.redAccent),
          ),
          context: context,
          type: scoreCorrect > scoreIncorrect
              ? AlertType.success
              : AlertType.error,
          title: scoreCorrect > scoreIncorrect ? "YOU WON" : "GAME OVER",
          desc: scoreCorrect > scoreIncorrect
              ? "Awesome you are a authentic GAMER."
              : "Take your second life and try again!",
          buttons: [
            DialogButton(
              color: Colors.indigoAccent,
              radius: BorderRadius.all(
                Radius.elliptical(
                  90.0,
                  90.0,
                ),
              ),
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        final player = AudioCache();
        player.play(scoreCorrect > scoreIncorrect ? 'win.mp3' : 'gameover.mp3');
        core.reset();
        scoreKeeper = [];
        scoreCorrect = 0;
        scoreIncorrect = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset('images/' + core.getItemImage()),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                core.getItemText(),
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
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  checkAnswer(true);
                },
                elevation: 2.0,
                fillColor: Colors.green,
                child: Icon(
                  Icons.check,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                elevation: 2.0,
                fillColor: Colors.red,
                child: Icon(
                  Icons.clear,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ],
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
