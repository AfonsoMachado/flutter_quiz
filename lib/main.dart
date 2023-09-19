import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

main() {
  runApp(const QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;

  void _answer() {
    setState(() {
      _selectedQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_selectedQuestion]),
            Answer('Resposta 1', _answer),
            Answer('Resposta 2', _answer),
            Answer('Resposta 3', _answer),
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() {
    return _QuestionAppState();
  }
}
