import 'package:flutter/material.dart';


const iZblue = Color(0xFF5258c4);
const iZblueM = Color(0xFF7075CE);
const iZblueL = Color(0xFF999CDC);
const iZwhite = Color(0xFFFFFFFF);
const iZwhiteG = Color(0xFFF9F9F9);
const iZwhiteGM = Color(0xFFF1F1F2);
const iZwhiteGMD = Color(0xFFEBEBEC);
const iZgreen = Color(0xFF38A558);
const iZgreenL1 = Color(0xFF55B270);
const iZgreenL2 = Color(0xFF73C089);
const iZgreenL3 = Color(0xFF9BD2AB);
const iZblack = Color(0xFF181819);
const iZblackL1 = Color(0xFF3A3A3B);
const iZblackL2 = Color(0xFF5B5B5C);
const iZblackL3 = Color(0xFF707070);
const iZblackL4 = Color(0xFF78797D);
const double izDefultSpace = 25.0;


final mobileLoginHeading =  TextStyle( 
  fontSize: 22,
    color:iZwhite,
       fontWeight: FontWeight.w500,);

final bull = Icon(Icons.stop_circle, size:8, color: iZblue,);
       final welocomeContentText = TextStyle(
          fontSize: 14,
      color: iZblackL2,
    );
  


final otpInputDecoraion = InputDecoration(
   contentPadding: EdgeInsets.only(bottom: 10, top: 10),
 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: iZwhite, width:3,),),
 focusedBorder:  UnderlineInputBorder(borderSide: BorderSide(color: iZgreenL3,  width:3, ),),
);
  