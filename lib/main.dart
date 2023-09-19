import 'package:flutter/material.dart';

main() {
  runApp(QuestionApp());
}

class QuestionAppState extends State<QuestionApp> {
  var selectedQuestion = 0;

  void answer() {
    selectedQuestion++;
    print(selectedQuestion);
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
            Text(questions[selectedQuestion]),
            ElevatedButton(onPressed: answer, child: Text('Resposta 1')),
            ElevatedButton(onPressed: answer, child: Text('Resposta 2')),
            ElevatedButton(onPressed: answer, child: Text('Resposta 3'))
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  State<QuestionApp> createState() {
    return QuestionAppState();
  }
}
