import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:IzingaDating/datamodel/user_emaildata.dart';
import './who-are-you.dart';
import '../constantColor.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';
import '../api/api.dart';

class EmailFormScreen extends StatefulWidget {
  @override
  _EmailFormScreenState createState() => _EmailFormScreenState();
}

class _EmailFormScreenState extends State<EmailFormScreen> {
  TextEditingController emailController = TextEditingController();
  bool isEmailValidate = false;
  String emailErrorMsg = '';

  void _onLoading() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  bool validateEmailField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isEmailValidate = true;
        emailErrorMsg = "Email is required.";
      });
      return false;
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(userInput)) {
        setState(() {
          isEmailValidate = true;
          emailErrorMsg = "Enter a valid email address.";
        });
        return false;
      }
    }
    setState(() {
      isEmailValidate = false;
    });
    return true;
  }

  String email;

  _serverEmailValidation(String useremail) async {
    _onLoading();
    var data = jsonEncode({'email': useremail});
    final res = await CallApi().postData(data, '/check-email');
    // final body = jsonDecode(res.statusCode);
    if (res.statusCode == 422) {
      setState(() {
        isEmailValidate = true;
        emailErrorMsg = "Already registred another account with this email !";
      });
      Navigator.pop(context);
      return false;
    } else {
      setState(() {
        isEmailValidate = false;
        showAllText(context, email);
      });
      // return true;

    }
  }

  void showAllText(BuildContext context, String email) {
    final useremaildata = UserEmailData(
      email: email,
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WhoAreYou(useremaildata)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZwhiteG,
      appBar: topBackAppbarBlIcon(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: FormHeadingAndSubHeading(
                'Your Email',
                subHeding: "Let’s get your email",
                headingColor: iZblue,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  color: iZblue,
                  fontSize: 16,
                ),
                cursorColor: iZgreen,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  errorText: isEmailValidate ? emailErrorMsg : null,
                  counterStyle: TextStyle(
                    fontSize: 16,
                    color: iZblue,
                  ),
                  hintText: 'Enter your email ',
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
                onChanged: (value) {
                  setState(() {
                    isEmailValidate = false;
                  });
                  email = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: SizedBox(
                height: 50,
                width: 250,
                child: RaisedButton(
                  onPressed: () {
                    if (validateEmailField(emailController.text) == true) {
                      // Navigator.pushNamed(context, '/who-are-you');
                      _serverEmailValidation(email);
                    }
                  },
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
    );
  }
}
