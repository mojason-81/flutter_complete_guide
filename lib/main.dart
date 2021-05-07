import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        { 'text': 'Black', 'score': 10, },
        { 'text': 'Red',   'score': 5, },
        { 'text': 'Green', 'score': 3, },
        { 'text': 'White', 'score': 1, },
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        { 'text': 'Rabbit',   'score': 10, },
        { 'text': 'Snake',    'score': 5, },
        { 'text': 'Elephant', 'score': 3, },
        { 'text': 'Lion',     'score': 1, },
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        { 'text': 'Max',     'score': 10, },
        { 'text': 'Me',      'score': 5, },
        { 'text': 'Ug',      'score': 3, },
        { 'text': 'Not Max', 'score': 1, },
      ]
    },
  ];


  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });

    print(_totalScore);
    if (_questionIndex < _questions.length) {
      print('More quesitons');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
