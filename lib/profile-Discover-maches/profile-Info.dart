import 'package:IzingaDating/constantColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
backgroundColor:iZblueM,
  body:Stack(
 children: [
   Positioned(
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
FlatButton(onPressed: (){},
highlightColor: Colors.transparent, 
splashColor:Colors.transparent,
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(CupertinoIcons.search_circle_fill, size: 30,),
    Text('Discover')
  ],
),
),
FlatButton(onPressed: (){},
highlightColor: Colors.transparent, 
splashColor:Colors.transparent,
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(CupertinoIcons.suit_heart_fill),
    Text('Discover')
  ],
),
),
Expanded(child: SizedBox.shrink(), flex:2,),

FlatButton(onPressed: (){},
highlightColor: Colors.transparent, 
splashColor:Colors.transparent,
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(CupertinoIcons.shield_fill, ),
    Text('Discover',
    
    ),
  ],
),
),
FlatButton(onPressed: (){},
highlightColor: Colors.transparent, 
splashColor:Colors.transparent,
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(CupertinoIcons.person_fill),
    Text('Discover')
  ],
),
),
     ],
     ) ,
     ),
),
      


   ],
   ),
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