import 'package:flutter/material.dart';
import 'package:quizapp/quiz_model.dart';
import '../constants.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Questions> _questions = [
    Questions(
      id: '1', 
      title: 'Quem é o presidente do Brasil?', 
      opttions: {'Champolim':false, 'Bolsonaro':true, 'Lula':false}
      ),
    Questions(
      id: '2', 
      title: 'Quanto é 3 x 8?', 
      opttions: {'16':false, '18':false, '24':true}
      ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBaseColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Flutter Quiz'),
        backgroundColor: kQuizScaffoldColor,
      ),
      
    );
  }
}