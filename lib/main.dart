import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void answerQuestion() {
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('The Title')),
        body: Column(
          children: [
            Text('The question!'),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text(
                'Answer 1',
              ), // Replace null with a function to enable the button
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Answer 2 chosen!'),
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed: () => print('Answer 3 chosen! '),
            ),
          ],
        ),
      ),
    );
  }
}
