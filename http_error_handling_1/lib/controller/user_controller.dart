import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/repository.dart';

class UserController {
  final Repository _repository;
  List<User>? _userList;

  UserController(this._repository);

  Future<List<User>> fetchUserList() async {
    return _repository.getUsers().then((value) {
      return _userList = value;
    });
  }

  getUserNameById(int id) {
    var list = _userList?.where((element) => element.id == id).toList();
    return list?[0].username;
  }

  int get length => _userList?.length ?? 0;
  List<User> get users => _userList ?? [];
}
