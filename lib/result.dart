import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'Oh geeze....';
    } else if (resultScore <= 12){
      resultText = 'Pretty likeable I guess.';
    } else if (resultScore <= 16) {
      resultText = 'You\'re weird.';
    } else {
      resultText = 'You suck!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      )
    );
  }
}
