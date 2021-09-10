import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/models/Photo.dart';
import 'package:jsonplaceholder/models/Post.dart';
import 'package:jsonplaceholder/models/user_model.dart';

class Allservices {
  static String mainUrl = "https://jsonplaceholder.typicode.com/";
  var getUsersUrl = Uri.parse("$mainUrl/users");
  var getUsersPostUrl = Uri.parse("$mainUrl/posts");

  Future<List<UserModel>> fetchUsers() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      return List<UserModel>.from(
          json.decode(response.body).map((x) => UserModel.fromJson(x)));
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<PostModel>> fetchPosts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return List<PostModel>.from(
          json.decode(response.body).map((x) => PostModel.fromJson(x)));
    } else {
      throw Exception("Failed to load posts");
    }
  }

   Future<List<PhotoModel>> fetchAlbums() async {
    var response = await http.get(
        'https://jsonplaceholder.typicode.com/photos?albumId=');
        

    if (response.statusCode == 200) {
      return List<PhotoModel>.from(
          json.decode(response.body).map((x) => PhotoModel.fromJson(x)));
    } else {
      throw Exception("Failed to load photos");
    }
  }
}
