import 'package:flutter/material.dart';


class QuizAlternatives extends StatelessWidget {
  const QuizAlternatives({ Key? key, required this.option, required this.color, required this.onClick }) : super(key: key);
  final String option;
  final Color color;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: color,
        child: ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 21.0,
    
            ),
          ),
        ),
        
      ),
    );
  }
}