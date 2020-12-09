import 'package:IzingaDating/constantColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';
import 'loginConstructor/whoWeAreWidgets.dart';

class WhoAreYou extends StatefulWidget {
  @override
  
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
   List<String> lst = ['Male','Female','Other'];
  int selectedIndex = 0;
     List<String> list = ['Women','Men','Both'];
  int secondIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZwhiteG,
      appBar: topBackAppbarBlIcon(),
      body:Center(
        child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 50
                ),
                alignment: Alignment.center,
                child: FormHeadingAndSubHeading('Who Are You?', subHeding: "Let’s get the basic", headingColor: iZblue, ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextFieldprofileDetails('e.g Corrine', 'Name '),
                        SizedBox(
                          width: izDefultSpace,
                        ),
                        TextFieldprofileDetails('e.g M. Burns', 'Last Name'),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextFieldprofileDetails('e.g 16/11/2020', 'Date Of Birth'),
                        SizedBox(
                          width: izDefultSpace,
                        ),
                        TextFieldprofileDetails('e.g M. New Yark', 'City'),
                      ],
                    ),
                    FormHeading('Gender'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                           customRadio(lst[0],0),
                           SizedBox(width: 15,),
              customRadio(lst[1],1),
                    SizedBox(width: 15,),
              customRadio(lst[2],2),
            
                     
                      ],
                    ),
                    FormHeading('Interested'),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                           customRadio2(list[0],0),
                           SizedBox(width: 15,),
              customRadio2(list[1],1),
                    SizedBox(width: 15,),
              customRadio2(list[2],2),
            
                                       ],
                    ),

                   ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: DefalteButton('Next', onePress: null, btColor: iZwhite, btTextColor: iZblue,),
              ),
            ],
          ),
    ),
      ),
 
      
     );
  }
  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  Widget customRadio(String txt,int index){
    return Expanded(
      child: SizedBox(
        child: RaisedButton(
          onPressed: () => changeIndex(index),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(txt, style: TextStyle(color: selectedIndex == index ?iZwhite : iZblackL1, fontSize: 15),),
          color:selectedIndex == index ?iZblue : iZwhite,
        ),
      ),
    );
  }

    void changeSecondaryIndex(int index){
    setState(() {
      secondIndex = index;
    });
  }
  Widget customRadio2(String txt, int index){
    return Expanded(
      child: SizedBox(
        child: RaisedButton(
          onPressed: () => changeSecondaryIndex(index),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(txt, style: TextStyle(color: secondIndex == index ?iZwhite : iZblackL1, fontSize: 15),),
          color:secondIndex == index ?iZblue : iZwhite,
        ),
      ),
    );
  }
}








