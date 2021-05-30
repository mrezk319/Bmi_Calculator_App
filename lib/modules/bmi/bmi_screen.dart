import 'dart:math';
import 'package:flutter/material.dart';
import '../bmi_result/bmi_resul_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BminScreenState createState() => _BminScreenState();
}

class _BminScreenState extends State<BmiScreen> {
  bool isMale = true;
  double tall = 100;
  int age = 15;
  int weight = 45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all( 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:isMale?Colors.blue : Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/Male-icon.png'),width: 90,height: 100,),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "MALE",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:!isMale ?Colors.blue : Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/2000px-Venus_symbol.svg.png'),width: 90,height: 100,),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "FEMALE",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HIGHT",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${tall.round()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),
                          ),
                          Text(
                            "CM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),
                          ),
                        ],
                      ),
                      Slider(value: tall,max: 230,min: 140, onChanged: (value){
                        setState(() {
                          tall = value;
                        });
                      },
                      )
                    ],
          ),
                ),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "Age",
                             textAlign: TextAlign.center,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                           ),
                           Text(
                             "$age",
                             textAlign: TextAlign.center,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 heroTag: "age--",
                                 onPressed: (){
                                 setState(() {
                                   age--;
                                 });
                               },child: Icon(Icons.remove),mini: true,),
                               FloatingActionButton(
                                 heroTag: "age++",
                                 onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },child: Icon(Icons.add),mini: true,),
                             ],
                           ),
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.grey[400],
                       ),
                     ),
                   ),
                   SizedBox(width: 20,),
                   Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "Weight",
                             textAlign: TextAlign.center,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                           ),
                           Text(
                             "$weight",
                             textAlign: TextAlign.center,
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 heroTag: "wight--",
                                 onPressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },child: Icon(Icons.remove),mini: true,),
                               FloatingActionButton(
                                 heroTag: "wight++",
                                 onPressed: (){
                                 setState(() {
                                   weight++;
                                 });
                               },child: Icon(Icons.add),mini: true,),
                             ],
                           ),
                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.grey[400],
                       ),
                     ),
                   ),
                 ],
          ),
              )),
          Container(
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              onPressed: () {
                double result = weight/ pow (tall/100 ,2);
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>BmiResultScreen(
                  result : result,
                  age : age,
                  isMale: isMale,
                ))
                );
              },
              child: Text("CALCULATE",style: TextStyle(color: Colors.white),),
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
    );
  }
}
