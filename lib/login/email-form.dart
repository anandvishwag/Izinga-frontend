import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';

class ProfileBio extends StatefulWidget {
  @override
  _ProfileBioState createState() => _ProfileBioState();
}

class _ProfileBioState extends State<ProfileBio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBackAppbarBlIcon(),
      body: Form(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: FormHeadingAndSubHeading(
                  'Profile Bio',
                  subHeding: "Tell a bit about yourself",
                  headingColor: iZblue,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
                child: TextField(
                  maxLengthEnforced: true,
                  style: TextStyle(
                    color: iZblue,
                    fontSize: 16,
                  ),
                  maxLength: 300,
                  cursorColor: iZgreen,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    counterStyle: TextStyle(
                      fontSize: 16,
                      color: iZblue,
                    ),
                    hintText: 'Tell a bit about yourself',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: iZblueL,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: iZgreen,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    color: iZwhite,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 20,
                        color: iZblue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
