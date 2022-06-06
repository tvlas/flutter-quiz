import 'package:flutter/material.dart';
import '../constants.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({ Key? key, required this.finalResult, required this.questionLength }) : super(key: key);
  final int finalResult;
  final int questionLength;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBaseColor,
      content: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Pontuação', style: TextStyle(
            fontSize: 20.0,
            color: kNotClicked
          ),
        ),
        const Divider(color: Colors.white,),
        Container(
          width: double.infinity,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kNotClicked
          ),
          child: Text(
            '$finalResult', 
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kQuizScaffoldColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
              ),
            ),
        ),
      ],
     ),
    ),      
   );
  }
}