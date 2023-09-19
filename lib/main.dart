import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

main() {
  runApp(const QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  final _questions = const [
    {
      'text': 'Qual é o seu Jedi favorito?',
      'answers': [
        'Luke Skywalker',
        'Obi-wan Kenobi',
        'Ahsoka Tano',
        'Mestre Yoda'
      ]
    },
    {
      'text': 'Qual é o seu Sith favorito',
      'answers': ['Darh Vader', 'Darth Maul', 'Darth Sidious', 'Darth Tyranus'],
    },
    {
      'text': 'Qual o melhor filme de Star Wars?',
      'answers': [
        'O Império Contra-Ataca',
        'A Vingança dos Sith',
        'O Despertar da Força',
        'A Ameaça Fantasma'
      ]
    }
  ];

  void _answer() {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
      });
    }
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = hasSelectedQuestion
        ? _questions[_selectedQuestion].cast()['answers']
        : [];
    // Criando uma lista de widgets para enviar para o componente filho
    List<Answer> widgets =
        answers.map((text) => Answer(text, _answer)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz de Star Wars'),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Column(
                children: <Widget>[
                  Question(_questions[_selectedQuestion]['text'].toString()),
                  ...widgets
                  //Pega todas as respostas das passando o widger como parêmetro
                ],
              )
            : null,
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
