import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore; // Variable to hold the total score
  final Function resetHandler; // Function to handle quiz reset

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!'; // Default result text
    if (resultScore >= 25) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore >= 15) {
      resultText = 'Pretty likeable!';
    } else {
      resultText = 'You are ... strange?!';
    }
    return resultText; // Return the result text based on the score
  } // Constructor to initialize the result score

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              print('Restart Quiz!');
              resetHandler(); // Call the function
            },
            child: Text(
              'Restart Quiz!',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
