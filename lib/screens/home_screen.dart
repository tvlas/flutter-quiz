

import 'package:flutter/material.dart';
import 'package:quizapp/quiz_model.dart';
import 'package:quizapp/widgets/next_question_button.dart';
import '../constants.dart';
import '../widgets/quiz_question_.dart';
import '../widgets/quiz_alternative_card.dart';
import '../screens/scoreboard_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Quiz database
  final List<Questions> _questions = [

    Questions(
      id: '1', 
      title: 'Quem é o atual presidente do Brasil?', 
      alternative: {'Chapolim':false, 'Bolsonaro':true, 'Lula':false, 'Ciro Gomes':false}
      ),
    Questions(
      id: '2', 
      title: 'Quanto é 3 x 8?', 
      alternative: {'24':true,'16':false, '18':false, '22':false}
      ),

    Questions(
      id: '3', 
      title: 'Qual o nome do primeiro astronauta Brasileiro?', 
      alternative: {'Silvio Santos':false, 'Afonso Paulo':false, 'Gulherme Aguiar':false, 'Marcos Pontes':true}
      ),
    Questions(
      id: '4', 
      title: 'Quem inventou a lâmpada?', 
      alternative: {'Graham Bell':false, 'Henry Ford':false, 'Thomas Edison':true, 'Santos Dumont':false}
      ),
    Questions(
      id: '5', 
      title: 'A que temperatura a água ferve?', 
      alternative: {'200 ºC':false, '100 ºC':true, '50 ºC':false, '0 ºC':false}
      ),
  ];

  int index = 0;
  int score = 0;
  bool isClicked = false;
  bool answerAlreadyClicked = false;

  void nextQuestion(){
    if (index == _questions.length -1){
      showDialog(context: context, builder: (context) => ScoreBoard(finalResult: score, questionLength: _questions.length,));
    }else {
      if(isClicked) {
    setState(() {
      isClicked = false;
      answerAlreadyClicked =false;
      index++;
    });
  }else{
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Selecione uma das alternativa!', textAlign: TextAlign.center,),
      margin: EdgeInsets.symmetric(vertical: 15),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
      duration: Duration(milliseconds: 800),
      ),
    );
  }
 }
}

  void checkPlayerAnswer(bool value) {
    if(answerAlreadyClicked) {
      return;
    }else {
    if(value == true) {
      score+=5;
    }
    setState(() {
      if(value == false){
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Que pena você errou!', textAlign: TextAlign.center),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.redAccent,
      ),
    );
      }
      isClicked = true;
      answerAlreadyClicked = true;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBaseColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Flutter Quiz',
        style: TextStyle(
          fontFamily: 'Satisfy',
          fontSize: 30,
          fontWeight: FontWeight.w500
        ),),
        backgroundColor: kQuizScaffoldColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
            child: Container(
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(5)

            ),
              child: Text(
                '$score Pontos',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kQuizScaffoldColor),
                  textAlign: TextAlign.center,
                  )
              ),
            ),
        ],
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
            const Divider(color: Colors.white,),
            const SizedBox(height: 15.0,),
            for(int i = 0; i< _questions[index].alternative.length; i++)
            GestureDetector(
              onTap: () => checkPlayerAnswer(_questions[index].alternative.values.toList()[i]),
              child: QuizAlternatives(
                option:_questions[index].alternative.keys.toList()[i],
                color: isClicked ? 
                _questions[index].alternative.values.toList()[i] == true ? kCorrectOption : kWrongOption :kCardColor,
              ),
            ),
          ],
        ),
      ),
      //button goes here ---------------------
      floatingActionButton: NextQuestion(nextQuestion: nextQuestion,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}