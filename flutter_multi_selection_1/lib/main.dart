import 'package:flutter/material.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.orange[200]),
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
