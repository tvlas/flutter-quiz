import 'package:flutter/material.dart';
import 'package:quizapp/quiz_model.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import '../constants.dart';
import '../widgets/quiz_question_.dart';
import '../widgets/quiz_alternative_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Questions> _questions = [
    Questions(
      id: '1', 
      title: 'Quem é o atual presidente do Brasil?', 
      alternative: {'Chapolim':false, 'Bolsonaro':true, 'Lula':false}
      ),
    Questions(
      id: '2', 
      title: 'Quanto é 3 x 8?', 
      alternative: {'16':false, '18':false, '24':true}
      ),
  ];

  int index = 0;

  void nextQuestion(){
    if (index == _questions.length -1){
      return;
    }else {
    setState(() {
      index++;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBaseColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Flutter Quiz'),
        backgroundColor: kQuizScaffoldColor,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            QuestionWidget(
              indexQuestion: index,
              question: _questions[index].title,
              questionAmount: _questions.length,
            ),
            const Divider(color: Colors.black,),
            const SizedBox(height: 15.0,),
            for(int i = 0; i< _questions[index].alternative.length; i++)
            QuizAlternatives(
              option:_questions[index].alternative.keys.toList()[i]
            ),
          ],
        ),
      ),
      //button goes here ---------------------
      floatingActionButton: NextQuestion(
        nextQuestion: nextQuestion,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}