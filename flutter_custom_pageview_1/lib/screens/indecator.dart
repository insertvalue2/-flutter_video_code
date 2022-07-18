import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isAcive;
  const Indicator({
    Key key,
    this.isAcive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isAcive ? 22 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isAcive ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
