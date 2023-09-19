import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String text;

  const Answers(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
