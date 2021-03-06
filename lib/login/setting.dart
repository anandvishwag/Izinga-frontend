import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:IzingaDating/login/start-login.dart';
import 'package:flutter/cupertino.dart';
import '../constantColor.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';
import '../api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProfile extends StatefulWidget {
  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  ///Get current location
  bool _isLoading = true;

  //User Logout
  void logout(BuildContext context) async {
    //logout from the server
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var res = await CallApi().getData('/logout', {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var body = jsonDecode(res.body);

// claear the token../ user
    if (body['status']) {
      localStorage.remove('token');
      localStorage.remove('user');
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => StartLogin()));
    }
  }

  //Update Password
  String newpassword;
  Future<void> savepassword() async {
    String url = 'http://across.life2grow.com/api/update-password';
    var response = await http.post(url,
        headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
        body: {'newpassword': newpassword});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Navigator.pop(context);
  }

  final _formKey = GlobalKey<FormState>();
  final _locationformkey = GlobalKey<FormState>();
  final _interestformkey = GlobalKey<FormState>();
  final _distanceformkey = GlobalKey<FormState>();
  final _agerangeformkey = GlobalKey<FormState>();
  TextEditingController _controller;
  //String _initialValue;
  bool hidepassword = true;
  String currentAddress = 'Location';
  int minage;
  int maxage;
  RangeValues values = RangeValues(1, 100);
  getMinMax(minage, maxage) {
    double x = minage + .0;
    double y = maxage + .0;
    values = RangeValues(x, y);
  }

  @override
  void initState() {
    super.initState();
    //_initialValue = 'starValue';
    _controller = TextEditingController(text: 'starValue');
    _getUer();
  }

  String mobileNumber = '';
  String gender = '';

  int maxdistance = 40;
  String password = '123';
  _getUer() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var res = await CallApi().getData('/user', {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var jsonBody = json.decode(res.body);
      bool status = jsonBody['status'];
      var userInfo = jsonBody["user"]["user_info"];
      if (status) {
        if (userInfo["current_location"] != null) {
          currentAddress = userInfo["current_location"];
        }
        if (jsonBody["user"]["password"] != null) {
          password = jsonBody["user"]["password"];
        }

        setState(() {
          mobileNumber = jsonBody["user"]["mobile_number"];
          maxdistance = int.parse(userInfo["distance_range"]);
          minage = int.parse(userInfo["min_age"]);
          maxage = int.parse(userInfo["max_age"]);
          getMinMax(minage, maxage);
          _isLoading = false;
        });
      }
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> newPlace =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placeMark = newPlace.first;
    String name = placeMark.name;
    //String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    //String administrativeArea = placeMark.administrativeArea;
    //String postalCode = placeMark.postalCode;
    // String country = placeMark.country;
    String address = "$name, $locality";
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var data = jsonEncode({
        'current_location': address,
      });
      var res = await CallApi().postAuthRoute(data, '/update-location', {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var jsonBody = jsonDecode(res.body);
      var userInfo = jsonBody["user"]["user_info"];

      if (jsonBody['status']) {
        setState(() {
          currentAddress = userInfo['current_location'];
        });

        showToast(jsonBody['message']);
      } else {
        showToast(jsonBody['message']);
      }
    }

    Navigator.pop(context);
  }

  //Update interest
  String interest;
  Future<void> updateInterest() async {
    print(interest);

    //Navigator.pop(context);
  }

  void showToast(String phn) {
    Fluttertoast.showToast(
        msg: phn,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }

//update max distance
  int maxDistance;
  Future<void> updateDistance() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var data = jsonEncode({
        'distance_range': maxDistance,
      });
      var res = await CallApi().postAuthRoute(data, '/update-distance', {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var body = jsonDecode(res.body);
      if (body['status']) {
        showToast(body['message']);
      } else {
        showToast(body['message']);
      }
    }
  }

//update age range
  int fminage;
  int fmaxage;
  Future<void> updateAgeRange() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var data = jsonEncode({
        'min_age': fminage,
        'max_age': fmaxage,
      });
      var res = await CallApi().postAuthRoute(data, '/update-age-range', {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var body = jsonDecode(res.body);
      if (body['status']) {
        setState(() {
          minage = fminage;
          maxage = fmaxage;
        });
        getMinMax(minage, maxage);
        showToast(body['message']);
      } else {
        showToast(body['message']);
      }
    }
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'male',
      'label': 'Male',
      'textStyle': TextStyle(color: iZblackL4),
    },
    {
      'value': 'female',
      'label': 'Female',
      'textStyle': TextStyle(color: iZblackL4),
    },
    {
      'value': 'starValue',
      'label': 'Gender',
      'enable': false,
      'textStyle': TextStyle(color: iZblackL4),
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iZblack,
      appBar: TopBackAppBar(
        appbarColor: const Color(0x9638a558),
        title: 'Settings',
        onePressBack: () {},
        onePressClose: () {},
      ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: izDefultSpace,
                    right: izDefultSpace,
                    top: izDefultSpace,
                    bottom: 10),
                margin: EdgeInsets.symmetric(
                    horizontal: izDefultSpace, vertical: izDefultSpace),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: iZwhite,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/izinga-pluse.jpg',
                      width: 210,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Upgrade to Premium',
                        style: TextStyle(
                          fontSize: 14,
                          color: iZblueL,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: _isLoading
                    ? Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height - 280,
                          child: new Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              new CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              new Text(
                                "Loading..",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            SettingHeading(
                              content: 'Account Settings',
                            ),
                            SettingBoxes(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: setingBoxTextStyle(),
                                ),
                                Text(
                                  '$mobileNumber',
                                  style: setingBoxTextStyle(),
                                ),
                              ],
                            )),
                            SettingBoxes(
                              child: Form(
                                key: _formKey,
                                child: SizedBox(
                                  height: 40,
                                  child: TextFormField(
                                    initialValue: password,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.go,
                                    style: setingBoxTextStyle(),
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(color: iZblackL4),
                                        border: InputBorder.none,
                                        hintText: 'Reset Password',
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidepassword = !hidepassword;
                                            });
                                          },
                                          color: iZgreenL1.withOpacity(0.4),
                                          icon: Icon(hidepassword
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        )),
                                    // The validator receives the text that the user has entered.
                                    validator: MultiValidator([
                                      MinLengthValidator(8,
                                          errorText:
                                              "Password should be atleast 8 digit"),
                                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                          errorText:
                                              'Passwords must have at least one special character')
                                    ]),
                                    onFieldSubmitted: (value) {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          newpassword = value;
                                        });
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            });
                                        return savepassword();
                                      }
                                    },

                                    obscureText: hidepassword,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SettingHeading(
                                content: 'Discovery Settings',
                              ),
                            ),
                            SettingBoxes(
                              child: Text(
                                'Ratings & Reviews',
                                style: setingBoxTextStyle(),
                              ),
                            ),
                            Form(
                                key: _locationformkey,
                                child: Column(children: <Widget>[
                                  SettingBoxes(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          currentAddress == null
                                              ? ''
                                              : currentAddress,
                                          style: setingBoxTextStyle(),
                                        ),
                                        Container(
                                          child: SizedBox(
                                            width: 50.0,
                                            child: IconButton(
                                                color: iZgreen,
                                                icon:
                                                    Icon(CupertinoIcons.scope),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        );
                                                      });
                                                  _getCurrentLocation();
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                            SettingBoxes(
                              child: Form(
                                key: _interestformkey,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Interested',
                                      style: setingBoxTextStyle(),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: SelectFormField(
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: iZblue,
                                          letterSpacing: 1.04,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        textAlign: TextAlign.right,
                                        type: SelectFormFieldType.dropdown,
                                        controller: _controller,
                                        //initialValue: _initialValue,
                                        items: _items,
                                        onChanged: (value) {
                                          setState(() {
                                            interest = value;
                                          });
                                          return updateInterest();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SettingBoxes(
                                child: Form(
                              key: _distanceformkey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Max Distance',
                                        style: setingBoxTextStyle(),
                                      )),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '$maxdistance kms',
                                            style: setingBoxTextStyle(),
                                          ))
                                    ],
                                  ),
                                  Slider(
                                    activeColor: iZblueM,
                                    inactiveColor: iZwhiteGMD,
                                    min: 0,
                                    max: 100,
                                    value: maxdistance.toDouble(),
                                    onChanged: (double newValue) {
                                      setState(() {
                                        maxdistance = newValue.round();
                                      });
                                    },
                                    onChangeEnd: (val) {
                                      setState(() {
                                        maxDistance = val.round();
                                      });
                                      return updateDistance();
                                    },
                                  ),
                                ],
                              ),
                            )),
                            SettingBoxes(
                                child: Form(
                              key: _agerangeformkey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        'Age Range',
                                        style: setingBoxTextStyle(),
                                      )),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '$minage - $maxage',
                                            style: setingBoxTextStyle(),
                                          ))
                                    ],
                                  ),
                                  RangeSlider(
                                    activeColor: iZblueM,
                                    inactiveColor: iZwhiteGMD,
                                    min: 1,
                                    max: 100,
                                    values: values,
                                    divisions: 100,
                                    onChanged: (value) {
                                      setState(() {
                                        values = value;
                                        minage = value.start.round();
                                        maxage = value.end.round();
                                      });
                                    },
                                    onChangeEnd: (val) {
                                      setState(() {
                                        fminage = val.start.round();
                                        fmaxage = val.end.round();
                                      });
                                      return updateAgeRange();
                                    },
                                  )
                                ],
                              ),
                            )),
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: izDefultSpace, vertical: 6),
                                child: RaisedButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Text('Pause Account',
                                        style: TextStyle(
                                            fontSize: 20, color: iZblackL4)),
                                  ),
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: SettingHeading(
                                content: 'Contact Us',
                              ),
                            ),
                            DefalteButton(
                              'Help & Support',
                              btTextColor: iZblackL3,
                              btColor: iZwhite,
                              onePress: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'Delete Account',
                                  style: setingBoxTextStyle(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: DefalteButton('Logout',
                                  btTextColor: iZwhite,
                                  btColor: iZblue, onePress: () {
                                logout(context);
                              }),
                            ),
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle setingBoxTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: iZblackL4,
      letterSpacing: 1.04,
    );
  }

  TextStyle setingBoxTextStyleLocation() {
    return TextStyle(
      fontSize: 15,
      color: iZgreen,
      letterSpacing: 1.04,
    );
  }
}

class SettingBoxes extends StatefulWidget {
  final Widget child;
  const SettingBoxes({Key key, @required this.child}) : super(key: key);

  @override
  _SettingBoxesState createState() => _SettingBoxesState();
}

class _SettingBoxesState extends State<SettingBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: iZwhite,
      ),
      child: widget.child,
    );
  }
}

class SettingHeading extends StatelessWidget {
  final String content;
  const SettingHeading({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: izDefultSpace, vertical: 10),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 15,
          color: iZwhiteGMD,
          letterSpacing: 1.04,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
