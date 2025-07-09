import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText);
  // Constructor to initialize the question text

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Make the container take the full width of the parent
      margin: EdgeInsets.all(10), // Set margin around the container
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ), // Set the font size for the question text
        textAlign: TextAlign.center, // Center the text within the container
      ),
    );
  }
}
