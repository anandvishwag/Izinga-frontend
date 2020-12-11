import 'package:IzingaDating/constantColor.dart';
import 'package:IzingaDating/login/loginConstructor/form-Heading-And-SubHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../defalte-Button.dart';
import '../footerMenu.dart';

class ItsAMatch extends StatefulWidget {
  @override
  _ItsAMatchState createState() => _ItsAMatchState();
}

class _ItsAMatchState extends State<ItsAMatch> {

  @override
  Widget build(BuildContext context) {
double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: iZwhiteG,
      body: SafeArea (
              child: Stack(
            children: [
              Center(
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: izDefultSpace),
                 alignment: Alignment.topCenter,
 child: SingleChildScrollView(
 child: SizedBox(
    height: MediaQuery.of(context).size.height-60,
   child: Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,
   children: [

FormHeadingAndSubHeading('Profile Bio', headingColor: iZblue, ),
Container(
height: 200,
  child:Stack(
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
      margin: EdgeInsets.only(left: 20, top: izDefultSpace, bottom: izDefultSpace),
            child: CircleAvatar(
     backgroundImage: AssetImage('assets/img/profilePhoto-men.jpg'),
      ),
          height: screenWidth/2-50, width: screenWidth/2-50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      color: const Color(0xff181819),
      boxShadow: [
        BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(3, 3),
          blurRadius: 7,
        ),
      ],
    ),
  ),
         Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
     backgroundImage: AssetImage('assets/img/profilePhoto.jpg'),
      ),
          height: screenWidth/2-50, width: screenWidth/2-50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      color: const Color(0xff181819),
      boxShadow: [
        BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(3, 3),
          blurRadius: 7,
        ),
      ],
    ),
  ),
      ],
    ),
    Positioned( 
      bottom: -26, left:-30,
      child: SvgPicture.asset('assets/img/leaves-left.svg', width: 150,), 
      ),
       Positioned( 
      bottom: -26, right:-37,
      child: SvgPicture.asset('assets/img/leaves-right.svg', width: 150,), 
      ),
 Positioned (
  child:Container(
    height: double.infinity,
    alignment: Alignment.center,

    child: Container(
      alignment: Alignment.center,
      child: Icon(CupertinoIcons.heart_fill, size:50, color: iZwhiteG,),
              height: 85, width:85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
            color: const Color(0xff5258c4),
            border: Border.all(width: 0.3, color: const Color(0x987075ce)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(3, 3),
                blurRadius: 7,
              ),
          ],
    
        ),
    
      ),
  ),
),

    ],
  ),
),
      Text(
    'You and Brianna like each other, you can now send her a message',
    style: TextStyle(
           fontSize: 16,
      color:textGray,
    ),
    textAlign: TextAlign.center,
  ),
   Container(
     padding: EdgeInsets.only(bottom: 100),
     alignment: Alignment.center,
     child: Column(
       children:[
         DefalteButton(
        'Write to Brianna',
        onePress: (){},
        btTextColor:iZwhite,
        btColor: iZblue,
         ),
         SizedBox( height: 20,),
           DefalteButton(
        'Keep Browsing',
        onePress: (){},
        btTextColor:iZblue,
        btColor: iZwhiteG,
         ),
       ],
     ),
   ),     
                ],
                      ),
 ),
                  ),
                ),
              ),
                FooterMenu(),
            ],
          ),
      ),
    
    );
  }
}
