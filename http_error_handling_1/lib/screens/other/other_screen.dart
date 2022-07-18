import 'package:flutter/material.dart';
import 'package:http_error_handling_1/controller/user_controller.dart';
import 'package:provider/provider.dart';

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<UserController>(context);
    var users = controller.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Provier Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50.0,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 22.0),
                  Text(user.id.toString()),
                  const SizedBox(width: 22.0),
                  Text(user.username.toString()),
                  const Spacer(),
                  Text(user.phone.toString()),
                  const SizedBox(width: 22.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
