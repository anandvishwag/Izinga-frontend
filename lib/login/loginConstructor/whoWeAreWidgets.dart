import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constantColor.dart';

class FormHeading extends StatelessWidget {
 final String headingText;
 FormHeading( this.headingText);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          bottom: 15, top: izDefultSpace),
      child: Text(
        headingText,
        style: TextStyle(
          fontSize: 20,
          color: iZblackL1,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
class TextFieldprofileDetails extends StatelessWidget {
  final String hintTextin;
  final String lableTextin;

  TextFieldprofileDetails(this.hintTextin, this.lableTextin);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: iZgreen,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          icon: Icon(
            CupertinoIcons.staroflife_fill,
            color: iZblueL,
            size: 10,
          ),
          hintText: hintTextin,
          hintStyle: TextStyle(
            color: iZblueL,
          ),
          labelText: lableTextin,
          labelStyle: TextStyle(fontSize: 16, color: iZblueL),
          border: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: iZblueM)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: iZgreen)),
        ),
      ),
    );
  }
}


