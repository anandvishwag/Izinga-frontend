

import 'package:IzingaDating/constantColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  AppBar topBackAppbarGreenBg() {
    return AppBar( 
           backgroundColor:  const Color(0x9638a558),
       elevation: 0,
       leading: IconButton(icon: Icon(CupertinoIcons.chevron_left,
       size: 30,
       ), onPressed: () {  },),
       actions: [
         IconButton(icon: Icon(CupertinoIcons.multiply,
         size: 30,
         ),
          onPressed: () {
            
          },),
       ],
    );
  }

    AppBar topBackAppbarWtIcon() {
    return AppBar( 
           backgroundColor: Colors.transparent,
       elevation: 0,
       leading: IconButton(icon: Icon(CupertinoIcons.chevron_left,
       size: 30,
       ), onPressed: () {  },),

      
       actions: [
         IconButton(icon: Icon(CupertinoIcons.multiply,
         size: 30,
         ),
          onPressed: () {
            
          },),
       ],
    );
  }

     AppBar topBackAppbarBlIcon() {

    return AppBar( 
           backgroundColor: Colors.transparent,
       elevation: 0,
       leading: IconButton(icon: Icon(CupertinoIcons.chevron_left, color: iZblue,
       size: 30,
       ), onPressed: () {  },),
       actions: [
         IconButton(icon: Icon(CupertinoIcons.multiply, color: iZblue,
         size: 30,
         ),
          onPressed: () {
            
          },),
       ],
    );
  }

  // ignore: must_be_immutable
class TopBackAppBar extends StatefulWidget implements PreferredSizeWidget {
final Size preferredSize;
final Color appbarColor;
final Color tittleColor;
final Color iconColor;
final String title;
bool closeIconHide;
bool titleIconShow;
final VoidCallback onePressBack;
final VoidCallback onePressClose;

TopBackAppBar({Key key, 
this.onePressBack,
this.onePressClose,
this.appbarColor:Colors.transparent,       
this.tittleColor:Colors.white,
this.iconColor:Colors.white,
this.closeIconHide,
this.titleIconShow,
this.title:''
}) : preferredSize = Size.fromHeight(63.0), super(key: key);
  @override
  _TopBackAppBarState createState() => _TopBackAppBarState();
}
class _TopBackAppBarState extends State<TopBackAppBar>{
  @override
  Widget build(BuildContext context) {
 return AppBar( 
  backgroundColor:widget.appbarColor,
   elevation: 0,
   leading: IconButton(icon: Icon(CupertinoIcons.chevron_left, color: widget.iconColor,
       size: 30,
       ), onPressed:widget.onePressBack,
       ),
       centerTitle:true,
        title: Text(
        widget.title,
    style: TextStyle(
     fontSize: 30,
   color: widget.tittleColor,
      fontWeight: FontWeight.w700,
    ),
   
  ),
      actions: [
        (widget.closeIconHide == true)? Text(''): IconButton(icon: Icon(CupertinoIcons.multiply, color: widget.iconColor,
         size: 30,
         ),
          onPressed: widget.onePressClose,
          ) 
     
    ],
     
    );
  }
}


// ignore: must_be_immutable
