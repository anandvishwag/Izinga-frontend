
import 'package:flutter/material.dart';
import '../constantColor.dart';

class StartLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:iZblue ,
      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img/landingBag.jpg'), 
          fit: BoxFit.cover,
          alignment: AlignmentDirectional.topEnd, 
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 20),
          child: Center(
            child: Column( mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
Container(
  child:Column(children: [
    Container(
     child:Image.asset('assets/img/izinga-logo.png'),
     width: 195,
    ),
    SizedBox(height: 10,),
    Container(
      width: 300,
       child: Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Fira Sans',
          fontSize:16,
          color: iZwhite,
        ),
        children: [
          TextSpan(
            text: 'By tapping Log In, you agree with our ',
          ),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' and ',
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
    ),
    SizedBox(height: 20,),
   SizedBox(
  height:50,
  width: 250,
  child:RaisedButton(
    onPressed: (){},
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), 
      ),
      color: iZblue,
          child: Text('Create Account',
              style: TextStyle(
                  fontFamily: 'Fira Sans',
                  fontSize: 20,
                  color: iZwhite,
                  fontWeight: FontWeight.w500,
                                  ),
             
       ),
    ),
),
   SizedBox(
  height: 15,
),
SizedBox(
  height:50,
  width: 250,
  child:RaisedButton(
    onPressed: (){},
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0), 
      ),
      color: iZwhite,
         child: Text('Login',
                  style: TextStyle(
                       fontSize: 20,
                      color: iZblue,
                                        ),
                 
           ),
    ),
),
SizedBox(height: 10,),
FlatButton(onPressed: null, 
child:Text(
    'Trouble Logging In?',
      style: TextStyle(
        fontFamily: 'Fira Sans',
        fontSize: 14,
        color:iZwhiteGMD,
      ),
)

),
  ],)
)
            ],),
          ),
        ),
      ),
    );
  }
}