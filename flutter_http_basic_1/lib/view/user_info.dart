import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import '../models/user.dart';
import '../repository/user_repository.dart';

class UserInfo extends StatelessWidget {
  // Dependency Injection
  final _controller = UserController(UserRepository());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _controller.fetchUser(3),
      builder: (context, snapshot) {
        var user = snapshot.data;
        if (user == null || snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        return Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DefaultTextStyle(
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(user.id.toString()),
                Text(user.name),
                Text(user.email),
                Text(user.city),
                Text(user.phone),
              ],
            ),
          ),
        );
      },
    );
  }
}
