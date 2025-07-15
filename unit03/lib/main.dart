import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

import './result.dart';

import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0; // Variable to keep track of the total score

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pizza', 'score': 5},
        {'text': 'Burger', 'score': 3},
        {'text': 'Fired Chicken', 'score': 10},
      ],
    },
  ]; // List of questions with their respective answers

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0; // Reset the question index to 0
      _totalScore = 0; // Reset the total score to 0
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      if (_questionIndex < _questions.length) {
        print("We have more questions!");
      } else {
        print("No more questions!"); // Notify when there are no more questions
      }
      _totalScore +=
          score; // Update the total score with the selected answer's score
      _questionIndex++; // Increment the question index
    });
    // print(_questions[_questionIndex]);
    print(_questionIndex); // Print the current question index to the console
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
