import 'package:flutter/material.dart';
import 'question_bank.dart';

class QuizLogic {
  final Question_bank qb;
  List<Icon> scorekeeper;

  QuizLogic(this.qb, this.scorekeeper);

  void checkAnswer(bool A) {
    if (qb.getAnswer() == A) {
      scorekeeper.add(
        Icon(Icons.check, color: Colors.greenAccent),
      );
    } else {
      scorekeeper.add(
        Icon(Icons.close, color: Colors.redAccent),
      );
    }
    qb.nextItem();
  }
}