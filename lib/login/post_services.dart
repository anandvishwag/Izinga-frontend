// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:IzingaDating/model/post_model.dart';
import 'dart:io';

String url = 'http://across.life2grow.com/api/send-otp';

Future<List<PostNumber>> getAllPosts() async {
  final response = await http.get(url);
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<PostNumber> getPost() async {
  final response = await http.get('$url/1');
  return postFromJson(response.body);
}

Future<http.Response> createPost(PostNumber post) async {
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: postToJson(post));
  return response;
}

Future<http.Response> createPostOtp(PostOtp post) async {
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: postToJsonOtp(post));
  return response;
}



//Future<Post> createPost(Post post) async{
//  final response = await http.post('$url',
//      headers: {
//        HttpHeaders.contentTypeHeader: 'application/json'
//      },
//      body: postToJson(post)
//  );
//
//  return postFromJson(response.body);
//}
