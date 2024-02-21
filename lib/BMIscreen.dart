//import 'dart:html';

import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var msg = "";
  var bgColor = Color.fromARGB(255, 227, 244, 254);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "BMI",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text("Enter your weight in KGs"),
                          icon: Icon(Icons.line_weight),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: ftController,
                      decoration: InputDecoration(
                        label: Text("Enter your height in feet"),
                        icon: Icon(Icons.height_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                        label: Text("Enter your height in inch"),
                        icon: Icon(Icons.height_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var Inch = inController.text.toString();

                        if (wt != "" && ft != "" && Inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(Inch);

                          var tInch = ift * 12 + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;

                          var bmi = iwt / (tM * tM);

                          if (bmi > 25) {
                            bgColor = Color.fromARGB(255, 253, 164, 62);
                            msg = "You are overweight";
                          } else if (bmi < 18) {
                            msg = "You are underweight";
                            bgColor = Colors.red.shade400;
                          } else {
                            msg = "You are healthy!!";
                            bgColor = Colors.green.shade300;
                          }

                          setState(() {
                            result =
                                "Your BMI is : ${bmi.toStringAsFixed(2)} \n$msg";
                          });
                        } else {
                          result = "Please enter all required fields.";
                          setState(() {});
                        }
                      },
                      child: Text("Calculate BMI"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
