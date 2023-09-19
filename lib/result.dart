import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onResetQuiz;

  const Result(this.score, this.onResetQuiz, {super.key});

  String get resultPhrase {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: onResetQuiz,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ))
      ],
    );
  }
}
