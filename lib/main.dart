import 'package:flutter/material.dart';

import 'bottomWaveClipperClass.dart';
import 'variableAndConstantsDeclaration.dart';

Identifiers obj = Identifiers();
String finalExpression = "";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: obj.dark,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  buttonPressed(String text) {
    if (text == 'C') {
      obj.setEquationText('');
      obj.setResultText('');
      finalExpression = '';
    } else if (text == '⌫') {
      if (obj.getResultText() == '') {
        obj.setEquationText('');
        obj.setResultText('');
        finalExpression = '';
      } else {
        String t = obj.getEquationText();
        t = t.substring(0, t.length - 1);
        obj.setEquationText(t);
        obj.setResultText('');
        finalExpression = '';
      }
    } else if (text == "=") {
      String equn = obj.getEquationText();
      finalExpression = equn;
      finalExpression = finalExpression.replaceAll('×', '*');
      finalExpression = finalExpression.replaceAll('÷', '/');
      finalExpression = finalExpression.replaceAll('π', '3.141592654');
      finalExpression = finalExpression.replaceAll('√', '');
    }
  }

  Widget roundButtons({String buttonText, TextStyle style}) {
    return Expanded(
      child: FlatButton(
        shape: CircleBorder(),
        padding: EdgeInsets.all(8.0),
        onPressed: buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
        color: obj.light,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                    color: obj.dark,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            obj.getEquationText(),
                            style: obj.equationTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Text(
                            obj.getResultText(),
                            style: obj.resultTextStyle,
                          ),
                        )
                      ],
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        roundButtons(
                          buttonText: '+',
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: ' - ',
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: '×',
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: "÷",
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: "⌫",
                          style: obj.specialButtonStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        roundButtons(
                          buttonText: '7',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '8',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '9',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: "ln",
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: "log",
                          style: obj.specialButtonStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        roundButtons(
                          buttonText: '4',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '5',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '6',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: "π",
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: "e",
                          style: obj.specialButtonStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        roundButtons(
                          buttonText: '1',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '2',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '3',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '√',
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: '^',
                          style: obj.specialButtonStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        roundButtons(
                          buttonText: '.',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '0',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: '00',
                          style: obj.buttonStyle,
                        ),
                        roundButtons(
                          buttonText: "C",
                          style: obj.specialButtonStyle,
                        ),
                        roundButtons(
                          buttonText: "=",
                          style: obj.specialButtonStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
