import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../constantColor.dart';

import 'package:IzingaDating/model/postphoneresponse.dart';
import 'package:IzingaDating/login/post_services.dart';
import 'package:IzingaDating/model/post_model.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  String phnumber, counrycodeNumber;
  String showNumber = "", showCountryCode = "";
  int otpnumber = 0000;
  void shownumber() {
    setState(() {
      showNumber = phnumber;
      showCountryCode = counrycodeNumber;
      print(showNumber + " ==== " + counrycodeNumber);
      callAPI(showNumber, counrycodeNumber);
    });
  }

// 'mobile_number="9874563210"'
  void callAPI(String phn, String countrycode) {
    PostNumber post = PostNumber(mobile_number: phn, country_code: countrycode);
    createPost(post).then((response) {
      if (response.statusCode == 200) {
        PostNumberResponse post1 = postResponseFromJson(response.body);
        otpnumber = post1.otp;
        setState(() {});
        print("$response.body     $otpnumber");
      } else
        print(response.statusCode);
    }).catchError((error) {
      print('error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
      child: Column(
        children: [
          Text(
            'What is your phone number?',
            style: mobileLoginHeading,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            style: TextStyle(
              color: iZwhite,
              fontSize: 25,
            ),
            countryCodeTextColor: iZwhite,
            dropDownArrowColor: iZwhite,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: iZwhite,
                  width: 3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: iZgreenL3,
                  width: 3,
                ),
              ),
            ),
            initialCountryCode: 'US',
            onChanged: (phone) {
              phnumber = phone.completeNumber;
              counrycodeNumber = phone.countryCode;
              // print(phone.number);
            },
          ),
          RaisedButton(
            onPressed: shownumber,
            child: Text("Get otp"),
          ),
        ],
      ),
    );
  }
}
