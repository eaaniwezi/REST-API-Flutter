import 'package:flutter/material.dart';
import 'package:jsonplaceholder/models/user_model.dart';
import 'package:jsonplaceholder/screens/user_details_screen.dart';
import 'package:jsonplaceholder/services/all_services.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  Allservices _allservices = Allservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF151C26),
        title: Text("All Users"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: FutureBuilder(
          future: _allservices.fetchUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
                var _currentUser = snapshot.data;
        if (_currentUser != null) {
          _currentUser.removeWhere((element) => element.id != element.id);
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
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen(
                                    user: item,
                                  ),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              child: Text(item.username.substring(0, 1)),
                            ),
                            title: Text(item.username),
                            subtitle: Text(item.name),
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
        ),
      ),
    );
  }
}
