import 'dart:math';

class Calculos {
  Calculos._internal();
  static Calculos _instance = Calculos._internal();
  static Calculos get instance => _instance;

  double redondeaDouble(double value, int decimales) {
    double mod = pow(10.0, decimales);
    return ((value * mod).round().toDouble() / mod);
  }
}
