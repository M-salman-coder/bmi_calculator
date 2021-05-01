import 'package:bmi_calculator/Constantfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constantfile.dart';
import 'Containerfile.dart';
import 'IconText.dart';
import 'calculatorfile.dart';
import 'resultfile.dart';

const activecolor = Color(0xFF1D1E33);
const deactivecolor = Color(0xFF111328);
int sliderheight = 180;
int numberweight = 60;
int sliderage = 20;
enum gender {
  male,
  female,
}

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  gender selectgender;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = gender.male;
                    });
                  },
                  child: ContainerCode(
                    colors: selectgender == gender.male
                        ? activecolor
                        : deactivecolor,
                    cardwidget: RepatTextIconwidget(
                      iconData: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = gender.female;
                    });
                  },
                  child: ContainerCode(
                    colors: selectgender == gender.female
                        ? activecolor
                        : deactivecolor,
                    cardwidget: RepatTextIconwidget(
                      iconData: FontAwesomeIcons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: new ContainerCode(
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klablefile,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        sliderheight.toString(),
                        style: knumberfile,
                      ),
                      Text(
                        'CM',
                        style: klablefile,
                      ),
                    ],
                  ),
                  Slider(
                    value: sliderheight.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue) {
                      setState(() {
                        sliderheight = newvalue.round();
                      });
                    },
                  ),
                ],
              ),
              colors: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: new ContainerCode(
                colors: Color(0xFF1D1E33),
                cardwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: klablefile,
                    ),
                    Text(
                      numberweight.toString(),
                      style: knumberfile,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RounIcon(
                          iconData: FontAwesomeIcons.minus,
                          onpressed: () {
                            setState(() {
                              numberweight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RounIcon(
                          iconData: FontAwesomeIcons.plus,
                          onpressed: () {
                            setState(() {
                              numberweight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: new ContainerCode(
                colors: Color(0xFF1D1E33),
                cardwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: klablefile,
                    ),
                    Text(
                      sliderage.toString(),
                      style: knumberfile,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RounIcon(
                          iconData: FontAwesomeIcons.minus,
                          onpressed: () {
                            setState(() {
                              sliderage--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RounIcon(
                          iconData: FontAwesomeIcons.plus,
                          onpressed: () {
                            setState(() {
                              sliderage++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          GestureDetector(
            onTap: () {
              Braincalculate calc =
                  Braincalculate(height: sliderheight, weight: numberweight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmiresponse: calc.bmiresult(),
                            resulttext: calc.getResult(),
                            interpretation: calc.getinterpretation(),
                          )));
            },
            child: Container(
              alignment: Alignment.center,
              color: Color(0xFFEB1555),
              //margin: EdgeInsets.all(5.0),
              width: double.infinity,
              height: 35.0,
              child: Text(
                'CALCULATE',
                style: kcalculate,
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class RounIcon extends StatelessWidget {
  RounIcon({@required this.iconData, @required this.onpressed});
  final IconData iconData;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
