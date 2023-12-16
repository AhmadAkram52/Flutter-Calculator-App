import 'package:calculator_app/buttons.dart';
import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var inputValue = "";
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Text(inputValue == "" ? '0' : inputValue.toString(),
                        style:
                            const TextStyle(fontSize: 35, color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Text(result.toString(),
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white)),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: NetworkImage(netImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            btnClr: opColor,
                            title: "AC",
                            fontSize: 20,
                            onPress: () {
                              inputValue = "";
                              result = "";
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "DEL",
                            fontSize: 17,
                            onPress: () {
                              inputValue = inputValue.substring(
                                  0, inputValue.length - 1);
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "%",
                            onPress: () {
                              inputValue += '%';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "/",
                            onPress: () {
                              inputValue += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            btnClr: numColor,
                            title: "7",
                            onPress: () {
                              inputValue += '7';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "8",
                            onPress: () {
                              inputValue += '8';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "9",
                            onPress: () {
                              inputValue += '9';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "x",
                            onPress: () {
                              inputValue += 'x';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            btnClr: numColor,
                            title: "4",
                            onPress: () {
                              inputValue += '4';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "5",
                            onPress: () {
                              inputValue += '5';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "6",
                            onPress: () {
                              inputValue += '6';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "-",
                            onPress: () {
                              inputValue += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            btnClr: numColor,
                            title: "1",
                            onPress: () {
                              inputValue += '1';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "2",
                            onPress: () {
                              inputValue += '2';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: "3",
                            onPress: () {
                              inputValue += '3';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: opColor,
                            title: "+",
                            onPress: () {
                              inputValue += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcButton(
                            btnClr: numColor,
                            title: "0",
                            onPress: () {
                              inputValue += '0';
                              setState(() {});
                            },
                          ),
                          CalcButton(
                            btnClr: numColor,
                            title: ".",
                            onPress: () {
                              inputValue += '.';
                              setState(() {});
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              pressOnEqual();
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: opColor.withOpacity(.9),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 15),
                            ),
                            child: const Center(
                              child: Text(
                                '=',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                          // CalcButton(
                          //   btnClr: opColor,
                          //   title: "=",
                          //   onPress: () {
                          //     pressOnEqual();
                          //     setState(() {});
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void pressOnEqual() {
    String finalInput = inputValue.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel contextModel = ContextModel();

    double val = exp.evaluate(EvaluationType.REAL, contextModel);
    result = val.toStringAsFixed(2);
  }
}
