import 'package:flutter/material.dart';
class FormHeadingAndSubHeading extends StatelessWidget {
  final String bigHeading;
  final String subHeding;
  final Color headingColor;
  const FormHeadingAndSubHeading(
   
    this.bigHeading, {Key key, this.headingColor, this.subHeding = ""}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(bigHeading,
          style: TextStyle(
            fontSize: 30,
            color: headingColor,
            fontWeight: FontWeight.w700,
          ),
        ),
     Container(child:(subHeding.length < 2) ? null : Text(subHeding,
          style: TextStyle(
            fontSize: 16,
            color: headingColor,
          ),
        ),)
      ],
    );
  }
}