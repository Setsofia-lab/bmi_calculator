import 'dart:math';

class CalculatorBrain {
   CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

   double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    _bmi.toStringAsFixed(1);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    } else if (_bmi>18.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

 String getInterpretation() {
  if(_bmi >= 25){
      return 'You have a higher than normal weight. Workout you fat damn ass';
    } else if (_bmi>18.5){
      return 'Your weight is Normal, go and sleep, you deep shit';
    } else {
      return 'You hungry bustard, You\'re Underweight';
    }
  }

 }


