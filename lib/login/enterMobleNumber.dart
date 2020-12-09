import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../constantColor.dart';

class EnterMobileNumber extends StatefulWidget {
  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
           margin: EdgeInsets.only(left: izDefultSpace, right: izDefultSpace),
    child:Column(
            children: [
        Text(
  'What is your phone number?',
  style: mobileLoginHeading,
  textAlign: TextAlign.left,
),
SizedBox(
  height:20,
),
        IntlPhoneField( style: TextStyle(
          color:iZwhite,
          fontSize: 25,
        ),
        
              countryCodeTextColor: iZwhite,
              dropDownArrowColor: iZwhite,
                  decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: iZwhite, width:3,),),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: iZgreenL3, width:3,),),
                   
          ),
   initialCountryCode: 'US',
              onChanged: (phone) {
                  print(phone.completeNumber);
              },
  
  ),

      ],
    ),
  
  );
  }
}
 

