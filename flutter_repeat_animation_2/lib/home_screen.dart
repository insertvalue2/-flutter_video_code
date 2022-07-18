import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[100],
              ),
            ),
            IconAnimation()
          ],
        ),
      ),
    );
  }
}

class IconAnimation extends StatefulWidget {
  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  )..repeat(reverse: true);

  late Animation<Offset> _animationVertical =
      Tween(begin: Offset.zero, end: Offset(0.1, 0.9)).animate(_controller);

  late Animation<Offset> _animationHorizontal =
      Tween(begin: Offset(-0.5, 0), end: Offset(0.5, 0)).animate(_controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: _animationVertical,
          child: Icon(
            CupertinoIcons.capslock,
            size: 40.0,
          ),
        ),
        const SizedBox(height: 100),
        SlideTransition(
          position: _animationHorizontal,
          child: Icon(
            CupertinoIcons.arrow_left_right,
            size: 40.0,
          ),
        )
      ],
    );
  }
}
