import '../models/user.dart';
import '../repository/repository.dart';

class UserController {
  final Repository _repository;

  UserController(this._repository);

  Future<User> fetchUser(int id) async {
    return _repository.getUser(id);
  }
}
