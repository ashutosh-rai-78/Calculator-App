import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  var num1 = 0, num2 = 0, ans = 0;

  final TextEditingController firstNumber = TextEditingController(text: "");
  final TextEditingController secondNumber = TextEditingController(text: "");

  bool checkNumbers() {
    try {
      num1 = int.parse(firstNumber.text);
      num2 = int.parse(secondNumber.text);
      return true;
    } on FormatException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Number"),
        ),
      );

      setState(() {
        ans = 0;
      });
      return false;
    }
  }

  void add() {
    if (checkNumbers()) {
      setState(() {
        ans = num1 + num2;
      });
    }
  }

  void subtract() {
    if (checkNumbers()) {
      setState(() {
        ans = num1 - num2;
      });
    }
  }

  void multiply() {
    if (checkNumbers()) {
      setState(() {
        ans = num1 * num2;
      });
    }
  }

  void division() {
    if (checkNumbers()) {
      setState(() {
        try {
          ans = num1 ~/ num2;
        } on IntegerDivisionByZeroException catch (_) {
          ans = 0;
        }
      });
    }
  }

  void doClear() {
    setState(() {
      firstNumber.text = "";
      secondNumber.text = "";
      ans = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter first number',
                ),
                controller: firstNumber,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: const TextStyle(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter second number',
                ),
                controller: secondNumber,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Output : $ans",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: add,
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: subtract,
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: multiply,
                    child: const Text(
                      "*",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: division,
                    child: const Text(
                      "/",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: doClear,
                    child: const Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}