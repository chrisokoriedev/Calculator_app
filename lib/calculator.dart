import 'package:calculator/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalUi extends StatefulWidget {
  @override
  _CalUiState createState() => _CalUiState();
}

class _CalUiState extends State<CalUi> {
  String _expression = '';
  String _history = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clearAllOnClick(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clearASingleNum(String text) {
    setState(() {
      _expression = '';
    });
  }
void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
    print(_expression);
    print(_history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283637),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              _history,
              style: TextStyle(fontSize: 30, color: Color(0xFF545F61)),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              _expression,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
            alignment: Alignment(1, 1),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalButton(
                text: 'Ac',
                fillColor: 0xFF6C807F,
                callBack: clearAllOnClick,
              ),
              CalButton(
                text: 'C',
                fillColor: 0xFF6C807F,
                callBack: clearASingleNum,
              ),
              CalButton(
                text: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callBack: numClick,
              ),
              CalButton(
                text: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalButton(
                text: '7',
                callBack: numClick,
              ),
              CalButton(
                text: '8',
                callBack: numClick,
              ),
              CalButton(
                text: '9',
                callBack: numClick,
              ),
              CalButton(
                text: 'x',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalButton(
                text: '4',
                callBack: numClick,
              ),
              CalButton(
                text: '5',
                callBack: numClick,
              ),
              CalButton(
                text: '6',
                callBack: numClick,
              ),
              CalButton(
                text: '-',
                callBack: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalButton(
                text: '1',
                callBack: numClick,
              ),
              CalButton(
                text: '2',
                callBack: numClick,
              ),
              CalButton(
                text: '3',
                callBack: numClick,
              ),
              CalButton(
                text: '+',
                callBack: numClick,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalButton(
                text: '.',
                callBack: numClick,
              ),
              CalButton(
                text: '0',
                callBack: numClick,
              ),
              CalButton(
                text: '00',
                callBack: numClick,
              ),
              CalButton(
                text: '=',
                callBack: evaluate,
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
