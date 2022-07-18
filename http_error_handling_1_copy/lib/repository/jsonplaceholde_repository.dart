import 'dart:convert';
import 'dart:io';
import 'package:http_error_handling_1/models/album.dart';
import 'package:http_error_handling_1/models/user.dart';
import 'package:http_error_handling_1/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:http_error_handling_1/utility/http_exception.dart';

class JsonplaceholderRepository extends Repository {
  // make http
  String baseURL = 'https://jsonplaceholder.typicode.com';

  // http error handling
  dynamic _response(http.Response response) {
    print(response.request?.url);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  @override
  Future<List<User>> getUsers() async {
    List<User> userList = [];
    var url = Uri.parse('$baseURL/users');

    try {
      var response = await http.get(url);
      var responseJson = _response(response);
      for (var i = 0; i < responseJson.length; i++) {
        userList.add(User.fromJson(responseJson[i]));
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return userList;
  }

  @override
  Future<List<Album>> getAlbums(int userId) async {
    // error
    var url = Uri.parse('$baseURL/albums?userId=$userId');
    try {
      var response = await http.get(
        url,
        headers: {HttpHeaders.authorizationHeader: "your_api_token_here"},
      );

      var responseJson = _response(response) as List;
      return responseJson.map((e) => Album.fromJson(e)).toList();
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
