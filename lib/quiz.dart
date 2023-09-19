import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() onAnswered;

  const Quiz({
    super.key,
    required this.questions,
    required this.onAnswered,
    required this.selectedQuestion,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = hasSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];
    // Criando uma lista de widgets para enviar para o componente filho
    List<Answer> widgets =
        answers.map((text) => Answer(text, onAnswered)).toList();

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text'].toString()),
        ...widgets
        //Pega todas as respostas das passando o widger como parêmetro
      ],
    );
  }
}
