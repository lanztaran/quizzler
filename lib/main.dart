import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'score_page.dart'; // Import the ScorePage
import 'scorekeeper.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
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
  Question_bank qb = Question_bank();
  List<Icon> scorekeeper = [];
  late QuizLogic quizLogic;

  @override
  void initState() {
    super.initState();
    quizLogic = QuizLogic(qb, scorekeeper);
  }

  void checkQuizCompletion() {
    if (qb.item >= qb.qobj.length - 1) {
      // Navigate to ScorePage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScorePage(
            score: quizLogic.getScore(), // Pass the score
            totalQuestions: qb.qobj.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
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
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: qb.item >= qb.qobj.length - 1
                  ? null
                  : () {
                setState(() {
                  quizLogic.checkAnswer(true);
                  checkQuizCompletion(); // Check for completion
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: qb.item >= qb.qobj.length - 1
                  ? null
                  : () {
                setState(() {
                  quizLogic.checkAnswer(false);
                  checkQuizCompletion(); // Check for completion
                });
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