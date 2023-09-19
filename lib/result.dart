import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

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
    return Center(
      child: Text(
        resultPhrase,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
