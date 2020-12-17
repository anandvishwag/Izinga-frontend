import 'package:IzingaDating/login/post_services.dart';
import 'package:IzingaDating/login/welcomeScreen.dart';
import 'package:IzingaDating/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:convert';
import '../constantColor.dart';
import 'dart:io';

class Otpform extends StatefulWidget {
  @override
  _OtpformState createState() => _OtpformState();
}

class _OtpformState extends State<Otpform> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'We will text you a verification code.',
          style: mobileLoginHeading,
        ),
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.025),
          child: OTPTextField(
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 50,
            style: TextStyle(fontSize: 20, color: Colors.white),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            onCompleted: (pin) {
              smsOTP = pin;
              print("Completed: " + pin);
            },
          ),
          // child: PinEntryTextField(
          //   fields: 4,
          //   onSubmit: (text) {
          //     smsOTP = text as String;
          //   },

          // ),
        ),
        SizedBox(
          height: screenHeight * 0.04,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: FlatButton(
            onPressed: () {
              setState(() {});
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
              // showToast(context, smsOTP);
            },
            child: Text(
              'Enter code',
              style: mobileLoginHeading,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'Didn\'t Get The Code? Resend',
              style: TextStyle(
                fontFamily: 'Fira Sans',
                fontSize: 13,
                color: iZwhiteGMD,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

void postOtp(String phn, String otpnumber) {
  PostOtp otp = new PostOtp(mobile_number: phn, otp: otpnumber);
  createPostOtp(otp).then((response) {
    if (response.statusCode == 200) {
      //postFromJson(response.body);

      print("$response.body     $otpnumber");
    } else
      print(response.statusCode);
  }).catchError((error) {
    print('error : $error');
  });
}

void showToast(BuildContext context, String phn) {
  Fluttertoast.showToast(
      msg: phn,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1);
}

void fetchPost() async {
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: PostVariFyOTP());

  if (response.statusCode == 200) {
    return print(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

// 'mobile_number="9874563210"', otp="9884"
class PostVariFyOTP {
  final String mobile_number;
  final String otp;

  PostVariFyOTP({this.mobile_number, this.otp});

  factory PostVariFyOTP.fromJson(Map<String, dynamic> json) {
    return PostVariFyOTP(
      mobile_number: json['mobile_number'],
      otp: json[' otp'],
    );
  }
}

class GetResponse {
  final int userId;
  final int id;
  final String title;
  final String description;

  GetResponse({this.userId, this.id, this.title, this.description});

  factory GetResponse.fromJson(Map<String, dynamic> json) {
    return GetResponse(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      description: json[' description'],
    );
  }
}
