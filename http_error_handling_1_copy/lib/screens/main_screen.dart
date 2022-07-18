import 'package:flutter/material.dart';
import 'package:http_error_handling_1/controller/user_controller.dart';
import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/jsonplaceholde_repository.dart';
import 'package:http_error_handling_1/screens/detail_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/';
  var controller = UserController(JsonplaceholderRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Sample Code'),
      ),
      body: FutureBuilder<List<User>>(
        future: controller.fetchUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // you can custom
            return Center(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              var user = snapshot.data?[index] as User;
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailScreen.routeName,
                    arguments: user.id,
                  );
                },
                child: ListTile(
                  leading: Text(user.id.toString()),
                  title: Text(user.name.toString()),
                  subtitle: Text(user.email.toString()),
                  trailing: Text(user.website.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
