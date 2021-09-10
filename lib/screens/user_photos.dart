// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/models/post_model.dart';
import 'package:jsonplaceholder/models/photo_model.dart';
import 'package:jsonplaceholder/models/user_model.dart';
import 'package:jsonplaceholder/screens/image_viewer.dart';

class UsersPhotos extends StatefulWidget {
  final UserModel user;
  final PostModel post;
  UsersPhotos({
    Key key,
    this.user,
    this.post,
  }) : super(key: key);

  @override
  _UsersPhotosState createState() => _UsersPhotosState();
}

class _UsersPhotosState extends State<UsersPhotos> {
  Future<List<PhotoModel>> fetchAlbums() async {
    var response = await http.get(
        'https://jsonplaceholder.typicode.com/photos?albumId=' +
            widget.post.id.toString());

    if (response.statusCode == 200) {
      return List<PhotoModel>.from(
          json.decode(response.body).map((x) => PhotoModel.fromJson(x)));
    } else {
      throw Exception('Failed to load' + widget.user.username + "'s photos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151C26),
        title: Text(widget.user.username + "'s pictures"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchAlbums(),
          builder:
              (BuildContext context, AsyncSnapshot<List<PhotoModel>> snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  for (var item in snapshot.data)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageViewer(
                              photo: item,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Theme.of(context).accentColor.withAlpha(10),
                        child: Image.network(item.thumbnailUrl.toString()),
                      ),
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
