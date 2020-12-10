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
    'https://images.unsplash.com/photo-1603400901809-428fc7789849?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=639&q=80',
    'https://images.unsplash.com/photo-1603923956247-10a0e3882fea?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1868&q=80',
    'https://images.unsplash.com/photo-1604961410267-9f76682d25e9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=638&q=80',
    'https://images.unsplash.com/photo-1605993439219-9d09d2020fa5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80'
 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZwhiteG,
      body: SafeArea(
        child: Stack(
          children: [
            FooterMenu(),
            Center(
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
                                child: Image.network(
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
],),
),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
