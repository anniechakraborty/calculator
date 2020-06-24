import 'package:flutter/material.dart';

class Identifiers {
  Color dark = Colors.grey.shade900;
  Color light = Colors.yellow.shade600;
  String _equationText = "";
  String _resultText = "";
  var equationTextStyle = TextStyle(
    fontSize: 28.0,
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );
  var resultTextStyle = TextStyle(
    fontSize: 40.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );
  var specialButtonStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black54,
  );
  var buttonStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
  );
  String getEquationText() {
    return _equationText;
  }

  String getResultText() {
    return _resultText;
  }

  void setEquationText(String text) {
    _equationText = text;
  }

  void setResultText(String text) {
    _resultText = text;
  }

//  String getFinalExpression() {
//    return _finalExpression;
//  }
//
//  void setFinalExpression(String text) {
//    _finalExpression = text;
//  }
}
