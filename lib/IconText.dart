import 'package:bmi_calculator/Constantfile.dart';
import 'package:flutter/material.dart';

class RepatTextIconwidget extends StatelessWidget {
  RepatTextIconwidget({@required this.iconData, this.label});
  final IconData iconData;
  String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(height: 10.0),
        Text(
          label,
          style: klablefile,
        )
      ],
    );
  }
}
