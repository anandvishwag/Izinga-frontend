import 'package:IzingaDating/constantColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../footerMenu.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int _current = 0;
   List imgList = [
    'assets/img/img1.jpg',
     'assets/img/img2.jpg',
      'assets/img/img3.jpg',
       'assets/img/img4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZwhiteG,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child:Container(
               alignment: Alignment.topCenter,
                              child: SingleChildScrollView(
                                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 50,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: double.infinity,
                          child: IconButton(
                              icon: Icon(
                                CupertinoIcons.gear_alt_fill,
                                size: 30,
                                color: const Color(0xffd1d1d2),
                              ),
                              onPressed: () {})),
                      CarouselSlider(
                        items: imgList
                            .map((item) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0x0d000000),
                                      offset: Offset(5, 5),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                      width: double.infinity,
                                    ))))
                            .toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            aspectRatio: 3 / 2,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index ? iZgreen : iZblue,
                            ),
                          );
                        }).toList(),
                      ),
Container( margin: EdgeInsets.symmetric(horizontal:izDefultSpace),
padding:EdgeInsets.only(top:izDefultSpace),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
Container(child: Text.rich(
    TextSpan(
      style: TextStyle(
      fontSize: 24,
        color:iZblue,
        height: 1,
      ),
      children: [
        TextSpan(
          text: 'Brianna Mcgrey,',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        TextSpan(
          text: '  21',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    ),
  ),
  ),
  Container( 
    child:Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text('4.8',    style: TextStyle(
      fontSize: 20,
      color:iZblue,
    ),
     ),
    SizedBox( width: 5,),
     Icon(CupertinoIcons.star_fill, size: 20, color: iZblue,),
    ],
        ),
    ),
],
),
),
Container( margin: EdgeInsets.symmetric(horizontal:izDefultSpace),
padding:EdgeInsets.only(top:10),
child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children:[
    Row(
     crossAxisAlignment: CrossAxisAlignment.end,
      children: [
Icon(CupertinoIcons.circle_fill, size: 18, color: iZgreen,),
Padding(
  padding: const EdgeInsets.only(left: 5),
  child:   Text(
      'Online ',
      style: TextStyle(
             fontSize: 13,
        color: textGray,
           ),
    ),
),
    ],
    ),
  Row(
    children: [
    Icon(CupertinoIcons.placemark_fill, size: 20, color: iZblue,),
Padding(
  padding: const EdgeInsets.only(left: 5),
  child:   Text(
      'San Deigo, CA  ',
      style: TextStyle(
             fontSize: 15,
        color: textGray,
           ),
    ),
),  
    ],
  ),
  ],
),
),
Container(
  margin: EdgeInsets.symmetric(horizontal: izDefultSpace),
 padding: EdgeInsetsDirectional.only( top: 35),
 child:Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children:[
     Text(
    'About Me',
    style: TextStyle(
      fontSize: 18,
      color: iZblue,
      fontWeight: FontWeight.w500,
    ),
  ),
  Padding(
    padding: const EdgeInsets.only(left: 5, top: 10),
    child: Text(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
      style: TextStyle(
        fontSize: 14,
        color: textGray,
        height: 1.5384615384615385,
      ),
    
    ),
  ),
  SizedBox( height: 120,),
   ],
 ),
),
                    ],
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
