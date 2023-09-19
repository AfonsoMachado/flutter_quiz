import 'package:flutter/material.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/result.dart';

main() {
  runApp(const QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'text': 'Qual é o seu Jedi favorito?',
      'answers': [
        {'text': 'Luke Skywalker', 'score': 1},
        {'text': 'Obi-wan Kenobi', 'score': 3},
        {'text': 'Ahsoka Tano', 'score': 10},
        {'text': 'Mestre Yoda', 'score': 5},
      ]
    },
    {
      'text': 'Qual é o seu Sith favorito',
      'answers': [
        {'text': 'Darh Vader', 'score': 10},
        {'text': 'Darth Maul', 'score': 3},
        {'text': 'Darth Sidious', 'score': 5},
        {'text': 'Darth Tyranus', 'score': 1}
      ],
    },
    {
      'text': 'Qual o melhor filme de Star Wars?',
      'answers': [
        {'text': 'O Império Contra-Ataca', 'score': 10},
        {'text': 'A Vingança dos Sith', 'score': 5},
        {'text': 'O Despertar da Força', 'score': 3},
        {'text': 'A Ameaça Fantasma', 'score': 1}
      ]
    }
  ];

  void _answer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz de Star Wars'),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questions: _questions,
                onAnswered: _answer,
                selectedQuestion: _selectedQuestion)
            : Result(_totalScore, _restartQuiz),
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
