//import 'dart:html';

import 'package:flutter/material.dart';
///import 'package:quiz_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain=QuizBrain();

void main() => runApp(Quizz());

class Quizz extends StatelessWidget {
  const Quizz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea( 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizzeler(),
          ),
        ),
      ),
    );
  }
}

class Quizzeler extends StatefulWidget {
  Quizzeler({Key key}) : super(key: key);

  @override
  _QuizzelerState createState() => _QuizzelerState();
}

class _QuizzelerState extends State<Quizzeler> {
  
 List<Icon> scoreKeeper=[];
  void checkAnswer(bool userPickedAns){
    bool connrectAnswer=quizBrain.getCorrectAns();
    setState(() {

      if(quizBrain.isFinishid()==true){

        Alert(
          context: context,
           title: 'finishid',
           desc: 'You\'ve reached the end of the quiz.',
           ).show();

        quizBrain.reset();
        scoreKeeper=[];
      }

    else{

    if(userPickedAns==connrectAnswer){
      scoreKeeper.add(Icon(Icons.check,color:Colors.green));
    }
    else{
      scoreKeeper.add(Icon(Icons.close,color:Colors.red));
    }
      quizBrain.nextQuestion();
    }
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
               checkAnswer(true);
              },
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              textColor: Colors.white,
              color: Colors.red,
              child: Text( 
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),

        Row(
          children:
            scoreKeeper,
          
        )
      ],
    );
  }
}
