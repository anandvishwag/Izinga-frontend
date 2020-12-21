import 'package:IzingaDating/datamodel/user_emaildata.dart';

class UserLoginData {
  String firstname;
  String lastname;
  String dateobirth;
  String city;
  String gender;
  String intrested;
  String email;

  UserLoginData(
      {this.firstname,
      this.lastname,
      this.dateobirth,
      this.city,
      this.gender,
      this.intrested,
      this.email});
}
