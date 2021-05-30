import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  bool isMale;
  int age;
  double result;
  BmiResultScreen({this.isMale, this.age, this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(

                      child: Text(
                    "Ginder : ${isMale ? "Male" : "Female"}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                  Expanded(
                      child: Text(
                    "Age : $age",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Text(
                    "Result : ${result.round()}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
