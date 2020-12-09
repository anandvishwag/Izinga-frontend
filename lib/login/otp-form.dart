import 'package:flutter/material.dart';

import '../constantColor.dart';

  class Otpform extends StatefulWidget {
    @override
    _OtpformState createState() => _OtpformState();
  }
  
  class _OtpformState extends State<Otpform> {
    FocusNode pin2focusNode;
    FocusNode pin3focusNode;
    FocusNode pin4focusNode;
    @override
    void initState(){
        pin2focusNode = FocusNode();
        pin3focusNode = FocusNode();
        pin4focusNode = FocusNode();
        super.initState();
    }
    @override
    void dispose(){
      pin2focusNode.dispose();
      pin3focusNode.dispose();
      pin4focusNode.dispose();
      super.dispose();
    }
    void nextField({String value, FocusNode focusNode}){
      if (value.length == 1){
        focusNode.requestFocus();
      }
    }
    @override
    Widget build(BuildContext context) {
      return Column(
children: [
    Text(
  'We will text you a verification code.',
  style: mobileLoginHeading,
 ),
   SizedBox(
        height: 20, 
       ),
  Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           SizedBox(
            width:50,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25, color: iZwhite, fontWeight: FontWeight.w700,),
              textAlign:TextAlign.center,
               cursorColor: Colors.white,
               decoration: otpInputDecoraion,
               onChanged:(value){
                 nextField(value:value, focusNode: pin2focusNode);
               },
            ),
           ),
           SizedBox(
            width: 50,
            child: TextFormField(
              focusNode: pin2focusNode,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25, color: iZwhite, fontWeight: FontWeight.w700,),
              textAlign:TextAlign.center,
               cursorColor: Colors.white,
               decoration: otpInputDecoraion,
               onChanged:(value){
                 nextField(value:value, focusNode: pin3focusNode);
               },
            ),
           ),
           SizedBox(
            width: 50,
            child: TextFormField(
              focusNode: pin3focusNode,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: TextStyle(fontSize: 25, color: iZwhite, fontWeight: FontWeight.w700,),
              textAlign:TextAlign.center,
               decoration: otpInputDecoraion,
               onChanged:(value){
                 nextField(value:value, focusNode: pin4focusNode);
               },
            ),
           ),
           SizedBox(
            width: 50,
            child: TextFormField(
              focusNode: pin4focusNode,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 25, color: iZwhite, fontWeight: FontWeight.w700,),
              textAlign:TextAlign.center,
               cursorColor: Colors.white,
               decoration: otpInputDecoraion,
               onChanged:(value){
                 pin4focusNode.unfocus();
               },
            ),
           ),      
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
       ),
       Container(
         margin: EdgeInsets.only(bottom: 10),
child: FlatButton(onPressed: (){},
child: Text(
    'Enter code',
    style: mobileLoginHeading,
    textAlign: TextAlign.center,
  ),
),
       ),

     Container(
      child: FlatButton(onPressed: (){},
child: Text(
    'Didn\'t Get The Code? Resend',
    style: TextStyle(
       fontFamily: 'Fira Sans',
      fontSize:13,
      color: iZwhiteGMD,
    ),
    textAlign: TextAlign.center,
  ),
), 
     )
],
      );
    }
  }