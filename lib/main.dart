import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    // Function to handle answer selection
    setState(() {
      _questionIndex = _questionIndex + 1; // Increment the question index
    });
    print(_questionIndex); // Print the current question index to the console
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Red', 'Green', 'Blue'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Rabbit'],
      },
      {
        'questionText': 'What\'s your favorite food?',
        'answers': ['Pizza', 'Burger', 'Pasta'],
      },
    ]; // List of questions with their respective answers
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>).map((
              answer,
            ) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
