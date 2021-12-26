import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      print("Answer chosen!");
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        'questionText': 'What\s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\s your favorite animal?',
        'answers': ['Cat', 'Dog', 'Fish', 'Rabbit']
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max']
      }
    ];

    // questions = []; // does not work if questions is a const
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        backgroundColor: Color(0000000),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
