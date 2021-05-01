import 'dart:math';

import 'package:flutter/cupertino.dart';

class Braincalculate {
  Braincalculate({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;
  String bmiresult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.3) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than body normal weight.Try to exercise';
    } else if (_bmi > 18.3) {
      return 'You have a normal body weight.Good';
    } else {
      return 'You have less than normal body weight.Try to eat more';
    }
  }
}
