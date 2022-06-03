
import 'package:flutter/material.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({ Key? key, required this.question, required this.indexQuestion, required this.questionAmount }) : super(key: key);

  final String question;
  final int indexQuestion;
  final int questionAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexQuestion + 1}/$questionAmount: $question',
        style: const TextStyle(
          fontSize: 22.0,
        ),
      ),
      
    );
  }
}