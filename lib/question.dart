class Question{
  String questionText;
  bool questionAnser;

  Question(String q, bool a){
    questionText=q;
    questionAnser=a;
  }
}

Question newQuestion=Question('text',true);