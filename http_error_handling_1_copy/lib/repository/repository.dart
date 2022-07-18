import 'package:flutter/material.dart';
import 'package:http_error_handling_1/models/album.dart';
import 'package:http_error_handling_1/models/user.dart';

abstract class Repository {
  Future<List<User>> getUsers();
  Future<List<Album>> getAlbums(int userId);
}
