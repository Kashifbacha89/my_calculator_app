import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

final List<String> buttonText = [
  'e',
  '%',
  'sin',
  'clx',
  'C',
  '(',
  ')',
  '/',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '.',
  'DEL',
  '='
];

class CalProvider extends ChangeNotifier {
  String userQuestion = '';

  String get userQ => userQuestion;

  String userAnswer = '';

  String get userA => userAnswer;

  //Clear Pressed
  clearPressed() {
    userQuestion = '';
    userAnswer = '';
    notifyListeners();
  }

  //Del Pressed
  delPressed() {
    userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    notifyListeners();
  }

  //userInput
  userInput(int index) {
    userQuestion = userQuestion + buttonText[index];
    notifyListeners();
  }

  //Equal Pressed
  equal() {
    var question = userQuestion;
    question = question.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double res = exp.evaluate(EvaluationType.REAL, cm);
    String inString = res.toStringAsFixed(2);
    userAnswer = inString;
    notifyListeners();
  }

  List<String> answerList = [];
  List<String> get ansList => answerList;

  addAnswer() {
    answerList.add(userAnswer);
    print('AnsList: $ansList');
    notifyListeners();
  }

  List<String> questionList = [];
  List<String> get queList => questionList;
  addQuestion() {
    questionList.add(userQuestion);
    print('AnsList: $queList');
    notifyListeners();
  }

  clearHistory() {
    questionList.clear();
    answerList.clear();
    notifyListeners();
  }
}
