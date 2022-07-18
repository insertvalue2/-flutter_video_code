import 'package:flutter/material.dart';
import 'package:http_error_handling_1/controller/user_controller.dart';
import 'package:http_error_handling_1/repository/jsonplaceholde_repository.dart';
import 'package:http_error_handling_1/screens/home/detail_screen.dart';
import 'package:http_error_handling_1/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserController(JsonplaceholderRepository()))
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
