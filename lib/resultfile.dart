import 'package:bmi_calculator/Constantfile.dart';
import 'package:bmi_calculator/Containerfile.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.bmiresponse,
      @required this.resulttext,
      @required this.interpretation});
  final String bmiresponse;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BMI Result')),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 10.0,
                child: Center(
                  child: Text(
                    'your Result',
                    style: kresultfile,
                  ),
                ),
              )),
              Expanded(
                child: ContainerCode(
                  colors: activecolor,
                  cardwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resulttext,
                        style: TextStyle(fontSize: 25.0, color: Colors.green),
                      ),
                      Text(
                        bmiresponse,
                        style: kresultfile,
                      ),
                      Text(
                        interpretation,
                        style: kresultbody,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Color(0xFFEB1555),
                alignment: Alignment.center,
                height: 35.0,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Inputpage()));
                  },
                  child: Text(
                    'Re-Calculate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
