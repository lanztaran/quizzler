import 'package:flutter/material.dart';
import 'question_bank.dart';

class QuizLogic {
  final Question_bank qb;
  final List<Icon> scorekeeper;
  int score = 0;

  QuizLogic(this.qb, this.scorekeeper);

  void checkAnswer(bool userAnswer) {
    if (qb.getAnswer() == userAnswer) {
      score++;
      scorekeeper.add(Icon(Icons.check, color: Colors.green));
    } else {
      scorekeeper.add(Icon(Icons.close, color: Colors.red));
    }
    qb.nextItem();
  }

  int getScore() {
    return score;
  }
}

