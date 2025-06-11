import 'dart:ffi';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static var textStyle = TextStyle(
    color: Colors.purple,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Michrome',
  );
  static const numStyle = TextStyle(
    color: Colors.purple,
    fontSize: 35,
    fontWeight: FontWeight.bold,
    fontFamily: 'Savate',
  );
  var heightSlider = 90;
  var weightSlider = 20;

  double calculateBMI() {
    var heightInMtr = heightSlider / 100;
    var result = weightSlider / (heightInMtr * heightInMtr);
    return result.toPrecision(2);
  }

  String calculateStatus() {
    var result = calculateBMI();
    if (result < 18.5) {
      return 'Underweight';
    } else if (result >= 18.5 && result < 24.9) {
      return 'Normal';
    } else if (result >= 25 && result < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BODY MASS INDEX',
          style: TextStyle(
            color: Colors.purple.shade200,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Michroma',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset.zero,
                      blurRadius: 25,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('HEIGHT', style: textStyle),
                          Text('$heightSlider cms', style: numStyle),
                        ],
                      ),
                    ),
                    Slider(
                      value: heightSlider.toDouble(),
                      onChanged: (double value) {
                        heightSlider = value.toInt();
                        setState(() {});
                      },
                      min: 90,
                      max: 220,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white70,
                      thumbColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset.zero,
                      blurRadius: 25,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('WEIGHT', style: textStyle),
                          Text('$weightSlider kgs', style: numStyle),
                        ],
                      ),
                    ),
                    Slider(
                      value: weightSlider.toDouble(),
                      onChanged: (double value) {
                        weightSlider = value.toInt();
                        setState(() {});
                      },
                      min: 20,
                      max: 120,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white70,
                      thumbColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.shade200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset.zero,
                      blurRadius: 25,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('RESULT', style: textStyle),
                    ),
                    Text('${calculateBMI()}', style: numStyle),
                    Text(calculateStatus(), style: textStyle),
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

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
