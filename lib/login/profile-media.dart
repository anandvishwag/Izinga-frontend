import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../custom-icon-button.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';

class ProfileMedia extends StatefulWidget {
  @override
  _ProfileMediaState createState() => _ProfileMediaState();
}

class _ProfileMediaState extends State<ProfileMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: iZblack,
      appBar: topBackAppbarGreenBg(),
      body: Container(
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
    child: Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
  
children: [
  Container(
     child:FormHeadingAndSubHeading('Profile Media', subHeding: "Add some media to your profile", headingColor: iZwhite, ), ),
  Container(
    margin: EdgeInsets.only(top:15),
    child:SizedBox(
    height: 225, width: 225,
    child: CircleAvatar(
     backgroundImage: AssetImage('assets/img/profilePhoto.jpg'),
      ),
  ),
    ),
    Container(
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace),
   child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
     CustomIconButton(
       iconPress: (){
         print('buttonPess');
       },
       cBtIconColor: iZgreen,
       cBtIcon: CupertinoIcons.gear_alt,
     ),
     
        Container(
          margin: EdgeInsets.only( top:30),
          child: CustomIconButton(
       iconPress: (){
           print('buttonPess');
       },
       cBtHeight: 80,
       cBtWidht: 80,
       cBtIconColor: iZblueM,
       cBtIconSize: 40,
       cBtIcon: CupertinoIcons.camera,
     ),
        ),
        CustomIconButton(
       iconPress: (){
         print('buttonPess');
       },
       cBtIconColor: iZgreen,
       cBtIcon: CupertinoIcons.slider_horizontal_3,
     ),
   ],),
    ),
     Container(
       margin: EdgeInsets.only(bottom: izDefultSpace),
        child:DefalteButton('Finish', onePress: (){}, btTextColor: iZblue,),
              ),
],
    ),),
      ),
    );
  }
}

