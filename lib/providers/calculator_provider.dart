import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _input = "";
  String _result = "0";

  String get input => _input;
  String get result => _result;

  void append(String value) {
    _input += value;
    notifyListeners();
  }

  void clear() {
    _input = "";
    _result = "0";
    notifyListeners();
  }

  void delete() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
      notifyListeners();
    }
  }

  void calculate() {
    try {
      String expression = _input
          .replaceAll('×', '*')
          .replaceAll('÷', '/');

      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Jika hasil ".0" maka rapikan
      if (eval % 1 == 0) {
        _result = eval.toInt().toString();
      } else {
        _result = eval.toString();
      }
    } catch (e) {
      _result = "Error";
    }

    notifyListeners();
  }
}
