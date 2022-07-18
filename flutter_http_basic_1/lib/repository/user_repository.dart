import '../models/user.dart';
import 'repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository implements Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com/users';
  @override
  Future<User> getUser(int id) async {
    var url = Uri.parse(dataURL + '/$id');
    var response = await http.get(url);
    var body = response.body;

    return User.fromJson(json.decode(body));
  }
}
