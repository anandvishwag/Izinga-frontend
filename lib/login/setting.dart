import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantColor.dart';
import '../defalte-Button.dart';
import '../top-back-appbar.dart';
import 'package:select_form_field/select_form_field.dart';

class SettingProfile extends StatefulWidget {
  @override
  _SettingProfileState createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  final _formKey = GlobalKey<FormState>();
  final _formKeydiscovery = GlobalKey<FormState>();
  TextEditingController _controller;
  //String _initialValue;
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';
  bool hidepassword = true;
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

  RangeValues values = RangeValues(22, 35);
  int minage = 22;
  int maxage = 35;

  int maxdistance = 40;

  @override
  void initState() {
    super.initState();

    //_initialValue = 'starValue';
    _controller = TextEditingController(text: 'starValue');
  }

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
        child: Center(
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
                      '+919616861940',
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
                        validator: (input) => input.length > 3
                            ? "Password should be minimum 3 charector"
                            : null,
                        onFieldSubmitted: (v) {
                          print(v);
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
                    key: _formKeydiscovery,
                    child: Column(children: <Widget>[
                      SettingBoxes(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Location',
                              style: setingBoxTextStyle(),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                style: setingBoxTextStyle(),

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: iZgreen),
                                    border: InputBorder.none,
                                    hintText: 'My Current Location'),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SettingBoxes(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                onChanged: (val) =>
                                    setState(() => _valueChanged = val),
                                validator: (val) {
                                  setState(() => _valueToValidate = val);
                                  return null;
                                },
                                onSaved: (val) =>
                                    setState(() => _valueSaved = val),
                              ),
                            )
                          ],
                        ),
                      )
                    ])),
                SettingBoxes(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),
                  ],
                )),
                SettingBoxes(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          minage = value.start.toInt();
                          maxage = value.end.toInt();
                        });
                      },
                    )
                  ],
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
                            style: TextStyle(fontSize: 20, color: iZblackL4)),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                  child: DefalteButton(
                    'Logout',
                    btTextColor: iZwhite,
                    btColor: iZblue,
                    onePress: () {},
                  ),
                ),
              ],
            ),
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
