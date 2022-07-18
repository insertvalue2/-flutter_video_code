import 'package:flutter/material.dart';
import 'package:http_error_handling_1/screens/detail_screen.dart';
import 'package:http_error_handling_1/screens/main_screen.dart';

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
        appBarTheme: AppBarTheme(elevation: 0.0),
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        '/': (context) => MainScreen(),
        '/detail': (context) => DetailScreen()
      },
    );
  }
}
