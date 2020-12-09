import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../top-back-appbar.dart';
import 'enterMobleNumber.dart';
import 'otp-form.dart';
class VeryfyNumber extends StatefulWidget {
  @override
  _VeryfyNumberState createState() => _VeryfyNumberState();
}

class _VeryfyNumberState extends State<VeryfyNumber> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZblack,
      appBar: topBackAppbarGreenBg(),
     body:Container(
       decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [
          const Color(0x9638a558),
          const Color(0x9a343eb7),
          const Color(0xcc343bba)
        ],
        stops: [0.0, 1.0, 1.0],
      ),
    ),
child:Center(
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        EnterMobileNumber(),
        SizedBox(
          height: 50,
          
        ),
        Container(
          margin: EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
          child: Otpform(),
        ),
  ],
),
),
     ),
    );
  }
  }

