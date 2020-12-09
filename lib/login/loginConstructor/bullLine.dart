import 'package:flutter/material.dart';

import '../../constantColor.dart';

class BullLine extends StatelessWidget {
  final String text;
  BullLine(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
margin: EdgeInsets.symmetric(vertical: 5),
child: Row(
children: [
  Expanded(child:bull, flex: 0,),
  SizedBox(width: 5,),
  Expanded(flex: 1, child: Text(text,
        style:welocomeContentText,
        textAlign: TextAlign.left,
      ),),
],

),
);
  }
}