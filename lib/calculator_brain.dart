import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;
  double bmiValue;

  String label;
  String bmi;
  String description;

  CalculatorBrain(this.weight, this.height) {
    bmiValue = weight / (pow(height / 100, 2));
    bmi = bmiValue.toStringAsFixed(1);
  }

  String getLabel() {
    if (bmiValue >= 25) {
      label = 'Overweight';
    } else if (bmiValue >= 15.5) {
      label = 'Normal';
    } else {
      label = 'Underweight';
    }
    return label;
  }

  String getDescription() {
    if (bmiValue >= 25) {
      description = 'Try to exercise more!';
    } else if (bmiValue >= 15.5) {
      description = 'Very good!';
    } else {
      description = 'Try to eat more!';
    }
    return description;
  }
}
