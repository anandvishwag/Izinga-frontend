import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/bullLine.dart';

Container welcomeScreen() {
    return Container(
decoration: BoxDecoration(
color: iZwhiteG,
image: DecorationImage(image: AssetImage('assets/img/top-img.png'),
 fit: BoxFit.fitWidth,
        alignment: AlignmentDirectional.topEnd, 
 ),
),
child: Scaffold(
backgroundColor: Colors.transparent,
 appBar:  topBackAppbarWtIcon(),
 body:Container(
 width: double.infinity,
   child: Column(
     mainAxisAlignment: MainAxisAlignment.end,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
Container(
      padding: EdgeInsets.only(left:izDefultSpace, right: izDefultSpace, top: 30, bottom: 40),
      margin: EdgeInsets.only(left: izDefultSpace, right: izDefultSpace,),
      width: double.infinity,
      alignment: Alignment.topLeft,
         decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15.0),
    color:iZwhite,
    boxShadow: [
      BoxShadow(
        color: const Color(0x1a000000),
        offset: Offset(3, 3),
        blurRadius: 7,
      ),
    ],
  ),
   child: Column(
        children:[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: izDefultSpace),
            child: Text(
  'Welcome',
  style: TextStyle(
  fontSize: 28,
 color: iZblack,
 fontWeight: FontWeight.w700,
  ),
  textAlign: TextAlign.center,
),
          ),
Container(
alignment: Alignment.centerLeft,
child: Text(
      'You can expect to',
      style:welocomeContentText,
      textAlign: TextAlign.left,
    ),
),

BullLine('Record a short intro video or bio'),
BullLine('Upload photos of you or your dogs and cats'),
BullLine('Meet awesome people'),

        ],
      ),
    ),
Container(
margin:EdgeInsetsDirectional.only(top:50, bottom: 70),
child: SizedBox(
height:50,
width: 250,
child:RaisedButton(
  onPressed: (){},
  shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0), 
    ),
    color: iZblue,
        child: Text('Let’s go',
            style: TextStyle(
                fontSize: 20,
                color: iZwhite,
                fontWeight: FontWeight.w500,
                                ),
           
     ),
  ),
),
)
     ],
   ),
   ),
  
),
    );
  }