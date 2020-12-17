// Created using https://app.quicktype.io/

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

PostNumber postFromJson(String str) {
  final jsonData = json.decode(str);
  return PostNumber.fromJson(jsonData);
}

String postToJson(PostNumber data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

String postToJsonOtp(PostOtp data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<PostNumber> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<PostNumber>.from(jsonData.map((x) => PostNumber.fromJson(x)));
}

String allPostsToJson(List<PostNumber> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PostNumber {
  String mobile_number;
  String country_code;

  PostNumber({
    this.mobile_number,
    this.country_code,
  });

  factory PostNumber.fromJson(Map<String, dynamic> json) => new PostNumber(
        mobile_number: json["mobile_number"],
        country_code: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_number": mobile_number,
         "country_code": country_code,
      };
}

class PostOtp {
  String mobile_number;
  String otp;
  //'mobile_number="9874563210"', otp="9884"
  PostOtp({
    this.mobile_number,
    this.otp,
  });

  factory PostOtp.fromJson(Map<String, dynamic> json) => new PostOtp(
        mobile_number: json["mobile_number"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_number": mobile_number,
        "otp": mobile_number,
      };
}

