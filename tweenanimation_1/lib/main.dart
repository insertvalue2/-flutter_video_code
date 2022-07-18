import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var _count = 0.74;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation_1'),
        ),
        body: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1500),
          tween: Tween(begin: 0.0, end: _count),
          builder: (_, double value, __) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: value,
                    ),
                    SizedBox(height: 16.0),
                    Text('${(value * 100).round()}%'),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1500),
          builder: (_, double value, child) {
            return Transform.rotate(
              angle: (math.pi * 2) * value,
              child: child,
            );
          },
          tween: Tween(begin: 0.0, end: _count),
          child: FloatingActionButton(
            onPressed: _count > 1
                ? null
                : () {
                    setState(() {
                      _count += 1;
                    });
                  },
            child: Icon(Icons.star_outline),
          ),
        ),
      ),
    );
  }
}
