import 'package:flutter/material.dart';
import 'package:jsonplaceholder/models/post_model.dart';
import 'package:jsonplaceholder/models/user_model.dart';
import 'package:jsonplaceholder/screens/user_photos.dart';
import 'package:jsonplaceholder/services/all_services.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserModel user;
  UserDetailsScreen({Key key, this.user}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  Allservices _allservices = Allservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151C26),
        title: Text(widget.user.username),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .17,
              child: _buildUserPost()),
          Container(
              height: MediaQuery.of(context).size.height * .7,
              child: _otherUsersList())
        ],
      ),
    );
  }

  _otherUsersList() {
    return FutureBuilder(
      future: _allservices.fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        var _currentUser = snapshot.data;
        if (_currentUser != null) {
          _currentUser.removeWhere((element) => element.id == widget.user.id);
        }
        if (snapshot.hasData) {
          return Card(
            child: ListView(
              children: [
                for (var item in snapshot.data)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: Text(item.username.substring(0, 1)),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.phone,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.website,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.company.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.company.catchPhrase,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  " \"${item.company.bs.toUpperCase()}\" ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  item.address.street,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.address.suite,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.address.city,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  item.address.zipcode,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildUserPost() {
    return FutureBuilder(
      future: _allservices.fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        var _currentUser = snapshot.data;
        if (_currentUser != null) {
          _currentUser.removeWhere((element) => element.id != widget.user.id);
        }
        if (snapshot.hasData) {
          return Card(
            child: ListView(
              children: [
                for (var items in snapshot.data)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: Text(
                              widget.user.username +
                                  "'s post title::  " +
                                  items.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            // color: Colors.pink,
                            child: Center(
                              child: Text(
                                items.body,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UsersPhotos(
                                              user: widget.user,
                                              post: items,
                                            )));
                              },
                              child: Text(
                                "Click for more",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
