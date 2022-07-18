import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue[200]),
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
