import 'package:flutter/material.dart';
import 'questionsController.dart';

void main() {
  runApp(MyApp());
}

QuestionsController questionsController = QuestionsController();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trivia',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.grey[350],
              fontSize: 20,
            ),
            button: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        home: Trivia());
  }
}

class Trivia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Trivia'),
      ),
      body: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> scoreElemn = [Text('Score: ')];

  void addScore(bool score) {
    if (scoreElemn.length < 13) {
      if (score) {
        setState(() {
          scoreElemn.add(Icon(
            Icons.mood,
            color: Colors.green,
          ));
        });
      }
      if (!score) {
        setState(() {
          scoreElemn.add(Icon(
            Icons.mood_bad,
            color: Colors.red,
          ));
        });
      }
      setState(() {
        questionsController.nextQuestion();
      });
    } else {
      //todo: place end game here
      print('End game');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: scoreElemn,
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  questionsController.getQuestionText(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        color: Colors.blue[400],
                        child: Text('True'),
                        onPressed: () {
                          addScore(questionsController.verifyAnswer(true));
                        },
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        color: Colors.teal[400],
                        child: Text('False'),
                        onPressed: () {
                          addScore(questionsController.verifyAnswer(false));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
