import 'package:IzingaDating/constantColor.dart';
import 'package:IzingaDating/datamodel/user_logindata.dart';
import 'package:IzingaDating/datamodel/user_emaildata.dart';
import 'package:IzingaDating/login/profile-bio.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'loginConstructor/form-Heading-And-SubHeading.dart';
import 'loginConstructor/whoWeAreWidgets.dart';

class WhoAreYou extends StatefulWidget {
  final UserEmailData userEmail;
  WhoAreYou(this.userEmail);
  @override
  _WhoAreYouState createState() => _WhoAreYouState(userEmail: userEmail);
}

class _WhoAreYouState extends State<WhoAreYou> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isNameValidate = false;
  bool isLastNameValidate = false;
  bool isDobValidate = false;
  bool isCityValidate = false;

  bool validateNameField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isNameValidate = true;
      });
      return false;
    }
    setState(() {
      isNameValidate = false;
    });
    return true;
  }

  bool validateLastNameField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isLastNameValidate = true;
      });
      return false;
    }
    setState(() {
      isLastNameValidate = false;
    });
    return true;
  }

  bool validateDobField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isDobValidate = true;
      });
      return false;
    }
    setState(() {
      isDobValidate = false;
    });
    return true;
  }

  bool validateCityField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isCityValidate = true;
      });
      return false;
    }
    setState(() {
      isCityValidate = false;
    });
    return true;
  }

  String firstname,
      lastname,
      dateobirth,
      city,
      gender = 'male',
      intrested = 'Women';
  List<String> lst = ['Male', 'Female', 'Other'];
  int selectedIndex = 0;
  List<String> list = ['Women', 'Men', 'Both'];
  int secondIndex = 0;
  final UserEmailData userEmail;
  _WhoAreYouState({this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZwhiteG,
      appBar: topBackAppbarBlIcon(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 50),
                alignment: Alignment.center,
                child: FormHeadingAndSubHeading(
                  'Who Are You?',
                  subHeding: "Let’s get the basic",
                  headingColor: iZblue,
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // TextFieldprofileDetails(
                        //   'e.g Corrine',
                        //   'Name ',
                        // ),
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: iZgreen,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                CupertinoIcons.staroflife_fill,
                                color: iZblueL,
                                size: 10,
                              ),
                              errorText:
                                  isNameValidate ? '*Name is required.' : null,
                              hintText: 'e.g Corrine',
                              hintStyle: TextStyle(
                                color: iZblueL,
                              ),
                              labelText: 'Name ',
                              labelStyle:
                                  TextStyle(fontSize: 16, color: iZblueL),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZblueM)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZgreen)),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isNameValidate = false;
                              });
                              firstname = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: izDefultSpace,
                        ),
                        // TextFieldprofileDetails('e.g M. Burns', 'Last Name'),
                        Expanded(
                          child: TextField(
                            controller: lastNameController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: iZgreen,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                CupertinoIcons.staroflife_fill,
                                color: iZblueL,
                                size: 10,
                              ),
                              hintText: 'e.g M. Burns',
                              hintStyle: TextStyle(
                                color: iZblueL,
                              ),
                              labelText: 'Last Name',
                              labelStyle:
                                  TextStyle(fontSize: 16, color: iZblueL),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZblueM)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZgreen)),
                              errorText: isLastNameValidate
                                  ? '*Lname is required.'
                                  : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                isLastNameValidate = false;
                              });
                              lastname = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        // TextFieldprofileDetails('e.g 16/11/2020', 'Date Of Birth'),
                        Expanded(
                          child: TextField(
                            controller: dobController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: iZgreen,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                CupertinoIcons.staroflife_fill,
                                color: iZblueL,
                                size: 10,
                              ),
                              hintText: 'e.g 16/11/2020',
                              hintStyle: TextStyle(
                                color: iZblueL,
                              ),
                              labelText: 'Date Of Birth',
                              labelStyle:
                                  TextStyle(fontSize: 16, color: iZblueL),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZblueM)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZgreen)),
                              errorText:
                                  isDobValidate ? '*DOB is Required.' : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDobValidate = false;
                              });
                              dateobirth = value;
                            },
                          ),
                        ),
                        SizedBox(
                          width: izDefultSpace,
                        ),
                        Expanded(
                          child: TextField(
                            controller: cityController,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: iZgreen,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                CupertinoIcons.staroflife_fill,
                                color: iZblueL,
                                size: 10,
                              ),
                              hintText: 'e.g M. New Yark',
                              hintStyle: TextStyle(
                                color: iZblueL,
                              ),
                              labelText: 'City',
                              labelStyle:
                                  TextStyle(fontSize: 16, color: iZblueL),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZblueM)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: iZgreen)),
                              errorText:
                                  isCityValidate ? '*City is required.' : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                isCityValidate = false;
                              });
                              city = value;
                            },
                          ),
                        ),
                        // TextFieldprofileDetails('e.g M. New Yark', 'City'),
                      ],
                    ),
                    FormHeading('Gender'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customRadio(lst[0], 0),
                        SizedBox(
                          width: 15,
                        ),
                        customRadio(lst[1], 1),
                        SizedBox(
                          width: 15,
                        ),
                        customRadio(lst[2], 2),
                      ],
                    ),
                    FormHeading('Interested'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customRadio2(list[0], 0),
                        SizedBox(
                          width: 15,
                        ),
                        customRadio2(list[1], 1),
                        SizedBox(
                          width: 15,
                        ),
                        customRadio2(list[2], 2),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   padding: EdgeInsets.only(top: 50, bottom: 50),
              //   child: RaisedButton('Next', onePress:() {

              //   }, btColor: iZwhite, btTextColor: iZblue,),

              // ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: RaisedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ProfileBio()),
                      // );

                      if (validateNameField(nameController.text) == true &&
                          validateLastNameField(lastNameController.text) ==
                              true &&
                          validateDobField(dobController.text) &&
                          validateCityField(cityController.text) == true) {
                        showAllText(context, firstname, lastname, dateobirth,
                            city, gender, intrested, userEmail.email);
                      }

                      /* if (isNameValidate == true) {
                        showAllText(context, firstname, lastname, dateobirth,
                            city, gender, intrested);
                      }*/
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

  void changeIndex(int index, String txt) {
    setState(() {
      selectedIndex = index;
      gender = txt;
    });
  }

  Widget customRadio(String txt, int index) {
    return Expanded(
      child: SizedBox(
        child: RaisedButton(
          onPressed: () => changeIndex(index, txt),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            txt,
            style: TextStyle(
                color: selectedIndex == index ? iZwhite : iZblackL1,
                fontSize: 15),
          ),
          color: selectedIndex == index ? iZblue : iZwhite,
        ),
      ),
    );
  }

  void changeSecondaryIndex(int index, String txt) {
    setState(() {
      secondIndex = index;
      intrested = txt;
    });
  }

  Widget customRadio2(String txt, int index) {
    return Expanded(
      child: SizedBox(
        child: RaisedButton(
          onPressed: () => changeSecondaryIndex(index, txt),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            txt,
            style: TextStyle(
                color: secondIndex == index ? iZwhite : iZblackL1,
                fontSize: 15),
          ),
          color: secondIndex == index ? iZblue : iZwhite,
        ),
      ),
    );
  }
}

void showAllText(BuildContext context, String firstname, String lastname,
    String dob, String city, String gender, String intrested, String email) {
  final userlogindata = UserLoginData(
      firstname: firstname,
      lastname: lastname,
      dateobirth: dob,
      city: city,
      gender: gender,
      intrested: intrested,
      email: email);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => ProfileBio(userlogin: userlogindata)),
  );
}
