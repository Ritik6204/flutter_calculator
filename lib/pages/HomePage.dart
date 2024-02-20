import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var operations = '';
  var result = '0';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        // color: Colors.red,
                        alignment: Alignment.centerLeft,
                        child: Text(operations,
                            style: const TextStyle(fontSize: 22)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        // color: Colors.amber,
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          result,
                          style: const TextStyle(fontSize: 30),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 500,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Buttons(
                      tapped: () {
                        setState(() {
                          operations = "";
                          result = "0";
                        });
                      },
                      color: Colors.green,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else if (index == 1) {
                    return Buttons(
                      tapped: () {
                        setState(() {
                          operations =
                              operations.substring(0, operations.length - 1);
                        });
                      },
                      color: Colors.red,
                      buttonText: buttons[index],
                      textColor: Colors.white,
                    );
                  } else if (index == buttons.length - 1) {
                    return Buttons(
                      tapped: () {
                        setState(() {
                          showAnswer();
                        });
                      },
                      color: Colors.orange[400],
                      buttonText: buttons[index],
                      textColor: Colors.deepPurple,
                    );
                  } else {
                    return Buttons(
                      tapped: () {
                        setState(() {
                          operations += buttons[index];
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.orange[400]
                          : Colors.white,
                      buttonText: buttons[index],
                      textColor: isOperator(buttons[index])
                          ? Colors.purple
                          : Colors.deepPurple,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == "+" || x == "-" || x == "*" || x == "/" || x == '%' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void showAnswer() {
    final solution = operations;
    Parser p = Parser();
    Expression exp = p.parse(solution);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
