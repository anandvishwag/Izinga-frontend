import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'package:passwordfield/passwordfield.dart';

class SettingProfile extends StatefulWidget {
  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  final _formKey = GlobalKey<FormState>();
  final _formKeydiscovery = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZblack,
      appBar: TopBackAppBar(
        appbarColor: const Color(0x9638a558),
        title: 'Settings',
        onePressBack: () {},
        onePressClose: () {},
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: izDefultSpace,
                      right: izDefultSpace,
                      top: izDefultSpace,
                      bottom: 10),
                  margin: EdgeInsets.symmetric(
                      horizontal: izDefultSpace, vertical: izDefultSpace),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: iZwhite,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/izinga-pluse.jpg',
                        width: 210,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Upgrade to Premium',
                          style: TextStyle(
                            fontSize: 14,
                            color: iZblueL,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SettingHeading(
                  content: 'Account Settings',
                ),
                SettingBoxes(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone Number',
                      style: setingBoxTextStyle(),
                    ),
                    Text(
                      '+919616861940',
                      style: setingBoxTextStyle(),
                    ),
                  ],
                )),
                SettingBoxes(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      height: 40,
                      child: PasswordField(
                        color: Colors.green,
                        hintText: "Reset Password",
                        backgroundColor: Colors.white,
                        backgroundBorderRadius: BorderRadius.circular(10),
                        hintStyle: TextStyle(color: iZblackL4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                Form(
                    key: _formKeydiscovery,
                    child: Column(children: <Widget>[
                      SettingBoxes(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: setingBoxTextStyle(),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                style: setingBoxTextStyle(),

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: iZgreen),
                                    border: InputBorder.none,
                                    hintText: 'My Current Location'),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SettingBoxes(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interested',
                              style: setingBoxTextStyle(),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                style: setingBoxTextStyle(),

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: iZgreen),
                                    border: InputBorder.none,
                                    hintText: 'My Current Location'),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SettingHeading(
                    content: 'Contact Us',
                  ),
                ),
                DefalteButton(
                  'Help & Support',
                  btTextColor: iZblackL3,
                  btColor: iZwhite,
                  onePress: () {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Delete Account',
                      style: setingBoxTextStyle(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: DefalteButton(
                    'Logout',
                    btTextColor: iZwhite,
                    btColor: iZblue,
                    onePress: () {},
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
      color: iZblackL4,
      letterSpacing: 1.04,
    );
  }

  TextStyle setingBoxTextStyleLocation() {
    return TextStyle(
      fontSize: 15,
      color: iZgreen,
      letterSpacing: 1.04,
    );
  }
}

class SettingBoxes extends StatefulWidget {
  final Widget child;
  const SettingBoxes({Key key, @required this.child}) : super(key: key);

  @override
  _SettingBoxesState createState() => _SettingBoxesState();
}

class _SettingBoxesState extends State<SettingBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: iZwhite,
      ),
      child: widget.child,
    );
  }
}

class SettingHeading extends StatelessWidget {
  final String content;
  const SettingHeading({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: 10),
      child: Text(
        content,
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
