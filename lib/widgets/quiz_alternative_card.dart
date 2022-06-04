import 'package:flutter/material.dart';


class QuizAlternatives extends StatelessWidget {
  const QuizAlternatives({ Key? key, required this.option }) : super(key: key);
  final String option;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Alternative selected');
      },
      child: Card(
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