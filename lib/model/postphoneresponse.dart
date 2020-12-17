import 'dart:convert';

List<PostNumberResponse> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<PostNumberResponse>.from(
      jsonData.map((x) => PostNumberResponse.fromJson(x)));
}

PostNumberResponse postResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return PostNumberResponse.fromJson(jsonData);
}

class PostNumberResponse {
  String mobile_number;
  bool success;
  int otp;

  PostNumberResponse({
    this.mobile_number,
    this.success,
    this.otp,
  });

  factory PostNumberResponse.fromJson(Map<String, dynamic> json) =>
      new PostNumberResponse(
        mobile_number: json["mobile_number"],
        success: json["success"],
        otp: json["otp"],
      );
}
