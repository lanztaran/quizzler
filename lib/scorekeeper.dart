import 'package:flutter/material.dart';
import 'question_bank.dart';

class QuizLogic {
  final Question_bank qb;
  List<Icon> scorekeeper;

  QuizLogic(this.qb, this.scorekeeper);

  void checkAnswer(bool answer) {
    if (qb.item >= qb.qobj.length - 1) {
      return;
    }

    if (qb.getAnswer() == answer) {
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
