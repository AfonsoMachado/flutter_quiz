import 'package:flutter/material.dart';
import 'package:flutter_quiz/answers.dart';
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
    print(_selectedQuestion);
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
            ElevatedButton(
                onPressed: _answer, child: const Answers('Resposta 1')),
            ElevatedButton(
                onPressed: _answer, child: const Answers('Resposta 2')),
            ElevatedButton(
                onPressed: _answer, child: const Answers('Resposta 3'))
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
