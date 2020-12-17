import 'dart:convert';

VarifyOtpResponse postFromJson(String str) {
  final jsonData = json.decode(str);
  return VarifyOtpResponse.fromJson(jsonData);
}

String postToJson(VarifyOtpResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}





class VarifyOtpResponse {
  String mobile_number;
  String otp;
  //'mobile_number="9874563210"', otp="9884"
  VarifyOtpResponse({
    this.mobile_number,
    this.otp,
  });

  factory VarifyOtpResponse.fromJson(Map<String, dynamic> json) => new VarifyOtpResponse(
        mobile_number: json["mobile_number"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_number": mobile_number,
        "otp":otp,
      };
}