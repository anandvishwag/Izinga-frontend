import 'package:IzingaDating/profile-Discover-maches/Its-a-mach.dart';
import 'package:flutter/material.dart';

//import 'profile-Discover-maches/profile-Info.dart';

//import 'login/setting.dart';

//import 'login/profile-media.dart';

//import 'login/welcomeScreen.dart';

// import 'login/verify-number.dart';

//import 'login/start-login.dart';

//import 'login/profile-bio.dart';
//import 'login/who-are-you.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Izinga',
      theme: ThemeData(
        fontFamily: 'Fira Sans',
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: //SettingProfile(),
      //ProfileInfo(),
      ItsAMatch(),
      //SettingProfile(),
      //ProfileMedia(),
      //ProfileBio(),
      //WhoAreYou(),
      //StartLogin(),
      //  VeryfyNumber(),
//welcomeScreen()
    );
  }
}
