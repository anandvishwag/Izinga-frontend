import 'package:IzingaDating/datamodel/user_logindata.dart';
import 'package:IzingaDating/datamodel/userlogin_completedata.dart';
import 'package:IzingaDating/login/profile-media.dart';
import 'package:flutter/material.dart';
import '../constantColor.dart';
// import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';

class ProfileBio extends StatefulWidget {
  final UserLoginData userlogin;

  ProfileBio({this.userlogin});

  @override
  _ProfileBioState createState() => _ProfileBioState(userlogindata: userlogin);
}

class _ProfileBioState extends State<ProfileBio> {
  TextEditingController profileBio = TextEditingController();
  bool isProfileBioValidate = false;

  String profileBioError = '';
  bool validateNameField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isProfileBioValidate = true;
        profileBioError = "Profile bio is required.";
      });
      return false;
    } else if (userInput.length > 300) {
      setState(() {
        isProfileBioValidate = true;
        profileBioError = "Profile bio should be atleast 300 charector.";
      });
      return false;
    }
    setState(() {
      isProfileBioValidate = false;
    });
    return true;
  }

  final UserLoginData userlogindata;
  String tellyourself;
  _ProfileBioState({this.userlogindata});
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
                alignment: Alignment.center,
                child: Text(userlogindata.firstname),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
                child: TextField(
                  controller: profileBio,
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
                    errorText: isProfileBioValidate ? profileBioError : null,
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
                      isProfileBioValidate = false;
                    });
                    tellyourself = value;
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
                      if (validateNameField(profileBio.text) == true) {
                        final userlogincompletedata = UserRegisterCompletedata(
                            userLoginData: userlogindata,
                            tellypurself: tellyourself);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileMedia(
                                  userRegisterCompletedata:
                                      userlogincompletedata)),
                        );
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
      ),
    );
  }
}
