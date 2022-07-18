import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.blue[100], borderRadius: BorderRadius.circular(12.0)),
      child: Center(
        child: Text(
          'Header',
          style: TextStyle(color: Colors.blue[200], fontSize: 25.0),
        ),
      ),
    );
  }
}
