import 'package:flutter/material.dart';


class QuizAlternatives extends StatelessWidget {
  const QuizAlternatives({ Key? key, required this.option, required this.color}) : super(key: key);
  final String option;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 21.0,
            color: Colors.white,
            fontWeight: FontWeight.w600
    
          ),
        ),
      ),
      
    );
  }
}