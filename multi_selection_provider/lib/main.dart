import 'package:flutter/material.dart';
import 'package:multi_selection_provider/models/my_item.dart';
import 'package:multi_selection_provider/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyItem()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.orange[200]),
          primarySwatch: Colors.orange,
        ),
        home: MainScreen(),
      ),
    );
  }
}
