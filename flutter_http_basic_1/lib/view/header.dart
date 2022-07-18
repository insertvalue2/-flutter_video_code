import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 58.0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.black,
        child: Center(
          child: Text(
            'Http Basic',
            style: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
