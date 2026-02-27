import 'package:flutter/material.dart';

import 'app_colors.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String result = '0';
  String firstValue = '0';
  String secondValue = '0';
  String operation = '';

  void onOperationPressed(String op){
    setState(() {
      firstValue = result;
      operation = op;
      result = '0';
    });
  }

  void onPlusMinusPressed() {
    setState(() {
      double value = double.parse(result);
      value = value * -1;
      result = value.toString().replaceAll(RegExp(r'\.0$'), '');
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800,
                  color: Colors.white),
                ),
                Row(
                  children: [
                    buildButton('C', color: grey,onTap: (){
                      result = '0';
                      firstValue = '0';
                      secondValue = '0';
                      operation = '';
                      setState(() {});
                    }),
                    buildButton('+/-', color: grey, onTap: () => onPlusMinusPressed()),
                    buildButton('%', color: grey),
                    buildButton('/', color: orange, onTap: () => onOperationPressed('/')),
                  ],
                ),
            Row(
              spacing: 8,
              children: [
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('x', color: orange, onTap: () => onOperationPressed('x')),

              ],
            ),
            Row(
              spacing: 8,
              children: [
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('-', color: orange, onTap: () => onOperationPressed('-')),

              ],
            ),
            Row(
              spacing: 8,
              children: [
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+',color: orange, onTap: () => onOperationPressed('+')
                ),

              ],
            ),
                Row(
                  spacing: 8,
                  children: [
                    buildButton('0'),
                    buildButton('.'),
                    buildButton('=',color: orange,onTap: () {
                      setState(() {
                        if (firstValue.isEmpty || operation.isEmpty) return;
                        double num1 = double.parse(firstValue);
                        double num2 = double.parse(result);
                        double finalResult = 0;
                        switch(operation) {
                          case '+': finalResult = num1 + num2; break;
                          case '-': finalResult = num1 - num2; break;
                          case 'x': finalResult = num1 * num2; break;
                          case '/': finalResult = num2 != 0 ? num1 / num2: 0; break;
                        }
                        result = finalResult.toString().replaceAll(RegExp(r'\.0$'), '');
                        firstValue = '';
                        operation = '';
                      });
                    }
                    ),
                  ],
                ),
                    ],
                  ),
          )),
    );
  }

  Widget buildButton(String text, {Function()? onTap, Color? color}) {
    return Expanded(
      flex: text=='0' ? 2:1,
      child: GestureDetector(
        onTap: onTap??
                (){
          setState(() {
            if (result == '0') {
              result = '';
            } else{
            result += text;
            }
          });
        },
        child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: color ?? blueBlack,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
      ),
    );
  }
}
