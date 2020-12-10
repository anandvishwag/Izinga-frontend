
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constantColor.dart';

class FooterMenu extends StatelessWidget {
  const FooterMenu({
    Key key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Positioned(
      left: 0, bottom: 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        width:size.width,
    child: Stack(
      children: [
AspectRatio(aspectRatio: 74/14,
child:CustomPaint(painter:MyPainter(),
      size: Size(size.width, double.infinity),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
Expanded(
  child:   FooterMenuIcons(
  
    menuIcon:CupertinoIcons.search_circle_fill,
  
     menuTitle: 'DISCOVER',
  
     menuColor: iZblackL1,
  
      onPressMenu: (){},),
),
    Expanded(
          child: FooterMenuIcons(
  menuIcon:CupertinoIcons.heart_fill,
   menuTitle: 'MATCHES',
   menuColor: iZblackL1,
      onPressMenu: (){},),
    ),

Expanded(child: SizedBox.shrink(), flex:1,),
   Expanded(
        child: FooterMenuIcons(
  menuIcon:CupertinoIcons.shield_fill,
     menuTitle: 'SAFETY',
     menuColor: iZblackL1,
      onPressMenu: (){},),
   ),
       Expanded(
                child: FooterMenuIcons(
  menuIcon:CupertinoIcons.person_fill,
   menuTitle: 'PROFILE',
   menuColor: iZblackL1,
    onPressMenu: (){},),
       ),
      ],
      ) ,
      ),
),
       Center(
         heightFactor: 0.0,
         child: FloatingActionButton(
           backgroundColor: iZwhite,
           onPressed: (){},
           child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.ellipses_bubble_fill,
             color: iZgreen,
             size:25),
                ),
             Positioned(
              left:20,
              bottom: 20,
               child:Container(
                 alignment: Alignment.center,
               height: 15, width: 15,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
      color:iZblueM,
    ),
    child: Text('12', style: TextStyle( color: iZwhite, fontSize: 8,),),
  ),),
         

           ],),
          
           ),
           ),

    ],
    ),
      ),
      );
  }
}

class FooterMenuIcons extends StatelessWidget {
final IconData menuIcon;
final Color menuColor;
final String menuTitle;
final VoidCallback onPressMenu;
  const FooterMenuIcons({
    Key key,
    @required this.menuIcon, this.menuTitle, this.menuColor, this.onPressMenu 
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: onPressMenu,
    highlightColor:Colors.transparent, 
    splashColor:Colors.transparent,

    shape: CircleBorder(),
    textColor: menuColor,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Icon(menuIcon, size:25,),
         SizedBox(height: 4,),
         Text(menuTitle, style: TextStyle(
         fontSize:11,
         ),
         ),
      ],
    ),
        );
  }
}





  class MyPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      Paint paint = Paint();
      Path path = Path();

      // Path number 1
      paint.color =iZwhite.withOpacity(1);
      path = Path();
      path.lineTo(size.width * 0.96, 0);
      path.cubicTo(size.width * 0.96, 0, size.width * 0.6, 0, size.width * 0.6, 0);
      path.cubicTo(size.width * 0.6, size.height * 0.3, size.width * 0.56, size.height * 0.54, size.width / 2, size.height * 0.54);
      path.cubicTo(size.width * 0.44, size.height * 0.54, size.width * 0.4, size.height * 0.3, size.width * 0.4, 0);
      path.cubicTo(size.width * 0.4, 0, size.width * 0.04, 0, size.width * 0.04, 0);
      path.cubicTo(size.width * 0.02, 0, 0, size.height * 0.1, 0, size.height / 5);
      path.cubicTo(0, size.height / 5, 0, size.height, 0, size.height);
      path.cubicTo(0, size.height, size.width, size.height, size.width, size.height);
      path.cubicTo(size.width, size.height, size.width, size.height / 5, size.width, size.height / 5);
      path.cubicTo(size.width, size.height * 0.1, size.width * 0.98, 0, size.width * 0.96, 0);
      path.cubicTo(size.width * 0.96, 0, size.width * 0.96, 0, size.width * 0.96, 0);
      canvas.drawPath(path, paint);
    }
    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
  }