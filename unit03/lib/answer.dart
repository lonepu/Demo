import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; // Function to handle button press
  final String answerText; // Text for the answer button
  Answer(
    this.selectHandler,
    this.answerText,
  ); // Constructor to initialize the selectHandler

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Make the container take the full width of the parent
      margin: const EdgeInsets.all(10), // Set margin around the container
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
        ),
        onPressed: () =>
            selectHandler(), // Call the selectHandler when the button is pressed
        child: Text(answerText), // Set the text and style for the button
      ),
    );
  }
}
