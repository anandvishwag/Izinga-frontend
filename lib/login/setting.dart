import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';


class SettingProfile extends StatefulWidget  {
  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: iZblack,
      appBar: TopBackAppBar(
    appbarColor:  const Color(0x9638a558),
    title: 'Setting',
    onePressBack: (){},
    onePressClose: (){},

      ),
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
child: Center(
child: SingleChildScrollView (
  child:   Column(
    children:[
  Container(
    padding:EdgeInsets.only( left: izDefultSpace, right: izDefultSpace, top: izDefultSpace, bottom:10),
    margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: izDefultSpace),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color:iZwhite,
      ),
  
    alignment: Alignment.center,
  
    child: Column(
  
    children: [
  
      Image.asset('assets/img/izinga-pluse.jpg', width:210,),
  
  SizedBox(height:2,),
  
      FlatButton(
  
        onPressed: (){},
  
            child: Text(
  
        'Upgrade to Premium',
  
        style: TextStyle(
  
          fontSize:14,
  
          color:iZblueL,
  
          letterSpacing: 1,
  
        ),
  
       ),
  
      ),
  
    ],
  
  ),),
  
    SettingHeading(
  
    content: 'Account Settings',
  
    ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  
  
    Padding(
  
      padding: const EdgeInsets.only( top: 10),
  
      child: SettingHeading(
  
      content: 'Discovery Settings',
  
      ),
  
    ),
  
  
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
  
    child: Text(
  
      'Ratings & Reviews',
  
      style: setingBoxTextStyle(),
  
      ),
  
  ),
  
  SettingBoxes(
      child: Text(
        'Ratings & Reviews',
        style: setingBoxTextStyle(),
        ),
    ),

    Padding(
      padding: const EdgeInsets.only( top: 10, bottom: 10),
      child: SettingHeading(
      content: 'Contact Us',
      ),
      ),
  DefalteButton(
   'Help & Support',
   btTextColor:iZblackL3,
   btColor: iZwhite,
   onePress: (){},
  ),
  Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(onPressed: (){}, child: Text(
          'Delete Account',
          style: setingBoxTextStyle(),
          ), ),
  ),
    Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: DefalteButton(
   'Logout',
   btTextColor:iZwhite,
   btColor: iZblue,
   onePress: (){},
  ),
    ),
    ],
  
  ),
),
    ),
      ),
    );
  }

  TextStyle setingBoxTextStyle() {
    return TextStyle(
      fontSize: 15,
    color:iZblackL4 ,
    letterSpacing: 1.04,
  );
  }
}
class SettingBoxes extends StatefulWidget {
  final Widget child;
  const SettingBoxes({
  Key key,
    @required this.child
  }) : super(key: key);

  @override
  _SettingBoxesState createState() => _SettingBoxesState();
}

class _SettingBoxesState extends State<SettingBoxes> {
  @override
  Widget build(BuildContext context) {
    return     Container(
    width: double.infinity,
        padding:EdgeInsets.all( 15),
    
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical:6),
    
          decoration: BoxDecoration(
    
          borderRadius: BorderRadius.circular(12.0),
    
          color:iZwhite,
    
        ),
    child: widget.child,
    
    );
  }
}

class SettingHeading extends StatelessWidget {
  final String content;
  const SettingHeading({
    Key key,
    @required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: 10),
      child: Text(content,
       style: TextStyle(
        fontSize: 15,
        color: iZwhiteGMD,
        letterSpacing: 1.04,
        fontWeight: FontWeight.w500,
      ),

    ),
    );
  }
}

