import 'package:flutter/material.dart';
import '../constants.dart';

class NextQuestion extends StatelessWidget {
  const NextQuestion({ Key? key, required this.nextQuestion }) : super(key: key);
  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kQuizScaffoldColor,
        ),
        width: 200,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: const Text(
          'Proxima pergunta', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: kBaseColor
          ),
          )
      ),
    );
  }
}