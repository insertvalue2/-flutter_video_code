import '../models/user.dart';

abstract class Repository {
  Future<User> getUser(int id);
}
