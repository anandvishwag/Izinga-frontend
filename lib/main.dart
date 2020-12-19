//import 'package:IzingaDating/profile-Discover-maches/Its-a-mach.dart';
import 'package:flutter/material.dart';

//import 'profile-Discover-maches/profile-Info.dart';

import 'login/setting.dart';

//import 'login/profile-media.dart';

//import 'login/welcomeScreen.dart';

//import 'login/verify-number.dart';

import 'login/start-login.dart';

//import 'login/profile-bio.dart';
//import 'login/who-are-you.dart';
//import 'login/email-form.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    //check if tocken is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      /* routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
       // '/': (context) => StartLogin(),
        // When navigating to the "/second" route, build the SecondScreen widget.
       // '/veryfy-number': (context) => VeryfyNumber(),
       // '/get-email': (context) => EmailFormScreen(),
        // '/who-are-you': (context) => WhoAreYou(),
      },*/
      debugShowCheckedModeBanner: false,
      title: 'Izinga',
      theme: ThemeData(
        fontFamily: 'Fira Sans',
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: _isLoggedIn ? SettingProfile() : StartLogin(),
      //ProfileInfo(),
      //ItsAMatch(),
      //SettingProfile(),
      //ProfileMedia(),
      //ProfileBio(),
      //WhoAreYou(),
      //StartLogin(),
      //VeryfyNumber(),
      //welcomeScreen()
    );
  }
}
