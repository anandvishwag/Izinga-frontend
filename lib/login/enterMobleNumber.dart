import 'package:IzingaDating/login/otp-form.dart';
import 'package:IzingaDating/model/postphoneresponse.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../constantColor.dart';

import 'package:IzingaDating/login/post_services.dart';
import 'package:IzingaDating/model/post_model.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  String phnumber, counrycodeNumber, getphonenumber;
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
        getphonenumber = post1.mobile_number;
        setState(() {
          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Otpform(mobilenumber: getphonenumber)),
                          );
        });
        print("$getphonenumber    $otpnumber");
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
            'What is your phone number?$otpnumber',
            style: mobileLoginHeading,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          IntlPhoneField(
            style: TextStyle(
              color: iZwhite,
              fontSize: 20,
            ),
            countryCodeTextColor: iZwhite,
            dropDownArrowColor: iZwhite,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: iZwhite,
                  width: 1,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: iZgreenL3,
                  width: 1,
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
