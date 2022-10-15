import 'package:flutter/material.dart';
import 'dart:math';
import 'constants.dart';

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 2;
  int counter = 0;

  void change(){
    setState(() {
      leftDice = Random().nextInt(6)+1;
      rightDice = Random().nextInt(6)+1;

      if(leftDice == rightDice) {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: change,
                child: Image.asset('images/dice$leftDice.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: change,
                child: Image.asset('images/dice$rightDice.png'),
              ),
            ),
          ],
        ),
        Text(
          'Your score: $counter',
          style: textStyleForBody,
        ),
      ],
    );
  }
}