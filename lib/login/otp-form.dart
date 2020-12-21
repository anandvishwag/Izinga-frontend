import 'package:IzingaDating/login/post_services.dart';
import 'package:IzingaDating/login/setting.dart';
import 'package:IzingaDating/login/welcomeScreen.dart';
import '../top-back-appbar.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class Otpform extends StatefulWidget {
  final String mobilenumber;

  Otpform({this.mobilenumber});
  @override
  _OtpformState createState() => _OtpformState(mobilenumber: mobilenumber);
}

class _OtpformState extends State<Otpform> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  final String mobilenumber;

  _OtpformState({this.mobilenumber});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: iZblack,
      appBar: topBackAppbarGreenBg(),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    print("Completed: " + smsOTP);
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
                    //  Navigator.pushReplacement(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Welcome()),
                    //             );
                    //  showToast(mobilenumber + "" + smsOTP);
                    postOtp(context, mobilenumber, smsOTP);
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
          ),
        ),
      ),
    );
  }
}

void postOtp(BuildContext context, String phn, String otpnumber) {
  PostOtp otp = new PostOtp(mobile_number: phn, otp: otpnumber);
  createPostOtp(otp).then((response) async {
    if (response.statusCode == 200) {
      //postFromJson(response.body);
      var userResponce = jsonDecode(response.body);

      VarifyOtpResponse varifyOtpResponse = getvarifyOtpFromJson(response.body);
      // String status =varifyOtpResponse.status;
      if (varifyOtpResponse.status) {
        if (userResponce['logedin']) {
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('token', userResponce['token']);
          localStorage.setString(
              'user', json.encode(userResponce['user_data']));
          var userJson = localStorage.getString('user');
          var user = json.decode(userJson);
          showToast(varifyOtpResponse.message);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SettingProfile()),
          );
        } else {
          String mobileNumber = userResponce['mobile_number'];
          SharedPreferences localStorage =
              await SharedPreferences.getInstance();
          localStorage.setString('mobile', mobileNumber);
          //String mobile = localStorage.getString('mobile');
          showToast(varifyOtpResponse.message);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        }
      } else {
        showToast(varifyOtpResponse.message);
      }

      //  print(varifyOtpResponse.message);
    } else {
      print(response.statusCode);
      showToast(response.body);
    }
  }).catchError((error) {
    print('error : $error');
  });
}

void showToast(String phn) {
  Fluttertoast.showToast(
      msg: phn,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1);
}

void _setSharedpref(String mobile) async {
  SharedPreferences.setMockInitialValues({});
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  localStorage.setString('mobile', mobile);

  var userJson = localStorage.getString('mobile');
  var user = json.decode(userJson);
  print(user['mobile']);
}
// void fetchPost() async {
//   final response = await http.post('$url',
//       headers: {
//         HttpHeaders.contentTypeHeader: 'application/json',
//         HttpHeaders.authorizationHeader: ''
//       },
//       body: PostVariFyOTP());

//   if (response.statusCode == 200) {
//     return print(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load post');
//   }
// }

// 'mobile_number="9874563210"', otp="9884"
// class PostVariFyOTP {
//   final String mobile_number;
//   final String otp;

//   PostVariFyOTP({this.mobile_number, this.otp});

//   factory PostVariFyOTP.fromJson(Map<String, dynamic> json) {
//     return PostVariFyOTP(
//       mobile_number: json['mobile_number'],
//       otp: json[' otp'],
//     );
//   }
// }
