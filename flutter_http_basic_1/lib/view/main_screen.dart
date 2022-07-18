import 'package:flutter/material.dart';
import 'user_info.dart';
import 'header.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.2, 1.0],
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: FractionalOffset.center,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Header(),
            UserInfo(),
          ],
        ),
      ),
    );
  }
}
