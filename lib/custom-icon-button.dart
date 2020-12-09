import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double cBtHeight;
final double cBtWidht;
final double cBtIconSize;
final Color cBtIconColor;
final Color cBtColor;
final IconData cBtIcon;
final VoidCallback iconPress;
  const CustomIconButton({
    Key key,
    this.cBtHeight:60,
     this.cBtWidht:60,
     @required this.cBtIcon,
      this.cBtIconSize:28,
       this.cBtIconColor:Colors.black12,
        this.cBtColor:Colors.white,
        this.iconPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Ink(
        height: cBtHeight,
        width: cBtHeight,
        decoration: BoxDecoration(
          shape:BoxShape.circle,
           boxShadow: [
       BoxShadow(
         color: const Color(0x20000000),
         offset: Offset(5, 5),
         blurRadius: 10,
       ),
     ],
        ),

        child: RaisedButton(
             color: cBtColor,
           elevation:0,
       child:Icon(cBtIcon, size: cBtIconSize, color:cBtIconColor,),
         shape: new RoundedRectangleBorder(
     borderRadius: new BorderRadius.circular(50.0),
    ),
   onPressed: iconPress,
        ),
      ),
      );
  }
}