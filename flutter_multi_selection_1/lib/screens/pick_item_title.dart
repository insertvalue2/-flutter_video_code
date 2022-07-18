import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickItemTitle extends StatelessWidget {
  final String title;
  const PickItemTitle({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        this.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      padding: const EdgeInsets.all(8.0),
      backgroundColor: Colors.orange[200],
    );
  }
}
