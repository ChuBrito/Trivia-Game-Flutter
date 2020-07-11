// import 'package:flutter/foundation.dart';
import 'dart:math';
import 'question.dart';
// import 'package:http/http.dart' as http;

class QuestionsController {
  String url =
      'https://opentdb.com/api.php?amount=30&category=15&difficulty=medium&type=boolean';
  //todo: make a request from https://opentdb.com/api_config.php to get questions.
  // Future<List<Question>> getQuestions(String questionsUrl) async {
  //   List rawList;
  //   http.get(questionsUrl).then((response) => {
  //         rawList = [response]
  //       }
  //     });

  //   return rawList;
  // }
  int _questionIndex = 0;

  List<Question> _questions = [
    Question(
        question:
            'The name of the main character of the video game &quot;The Legend of Zelda&quot;, is Zelda.',
        answer: false),
    Question(
        question:
            'In &quot;Mario Kart 64&quot;, Waluigi is a playable character.',
        answer: false),
    Question(
        question: '&quot;Half-Life 2&quot; runs on the Source Engine.',
        answer: true),
  ];

  nextQuestion() {
    _questionIndex = Random().nextInt(_questions.length);
  }

  String getQuestionText() {
    return _questions[_questionIndex].question;
  }

  bool verifyAnswer(bool userAction) {
    if (userAction == _questions[_questionIndex].answer) {
      return true;
    }
    if (userAction != _questions[_questionIndex].answer) {
      return false;
    } else {
      return false;
    }
  }
}
