import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BmiCalculatorApp());
}

// ignore: camel_case_types
class BmiCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: BmiCalculator(),
      ),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  ComputeBmi createState() => ComputeBmi();
}

class ComputeBmi extends State {
  TextEditingController bd_weight = TextEditingController();
  TextEditingController bd_height = TextEditingController();
  String output = "Enter the Data and Click on Button to See Results";
  String category = "";
  void calculateBMI() {
    var weight;
    var height;
    var bmi;

    weight = double.parse(bd_weight.text);
    height = double.parse(bd_height.text);
    bmi = weight / pow(height, 2);
    setState(() {
      output = "Your Body Mass Index is: " + bmi.toString();
      if (bmi < 16) {
        category = "Severely Underweight";
      } else if (bmi < 18.5) {
        category = "Underweight";
      } else if (bmi < 25) {
        category = "Normal";
      } else if (bmi < 30) {
        category = "Overweight";
      } else if (bmi > 30) {
        category = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
        ),
        child: Column(
          children: [
            TextField(
              controller: bd_weight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Please Input Weight Here in Kilograms",
                  labelText: "Weight: ",
                  prefixIcon: Icon(Icons.person, color: Colors.greenAccent)),
            ),
            Divider(),
            TextField(
              controller: bd_height,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Please Input Height Here in meters",
                  labelText: "Height: ",
                  prefixIcon: Icon(Icons.person, color: Colors.greenAccent)),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("Compute BMI"),
                    style: TextButton.styleFrom(
                        primary: Colors.black38,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.red),
                    onPressed: () {
                      calculateBMI();
                    },
                  ),
                )
              ],
            ),
            Text(output, style: TextStyle(fontSize: 18.0)),
            Text(category,
                style:
                    TextStyle(fontSize: 17.5, color: Colors.lightGreenAccent))
          ],
        ));
  }
}
