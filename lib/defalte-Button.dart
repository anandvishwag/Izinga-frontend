
import 'package:flutter/material.dart';

import 'constantColor.dart';

class DefalteButton extends StatelessWidget {

final String btText;
final Color btTextColor;
final Color btColor;
final VoidCallback onePress;
  const DefalteButton( this.btText, {Key key, @required this.onePress, this.btColor:iZwhite, this.btTextColor:iZblue,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, width: 250,
      child: RaisedButton(
        color: btColor,
       focusColor: iZblue,
              shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
          child: Text( btText,
    style: TextStyle(
          fontSize: 20,
          color:btTextColor,
          fontWeight: FontWeight.w500,
          height: 1.1111111111111112,
    ),
    textAlign: TextAlign.center,
  ),
  onPressed: (){},
  ),
    );
  }
}