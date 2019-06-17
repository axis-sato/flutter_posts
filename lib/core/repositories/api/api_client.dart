import 'dart:convert';
import 'package:flutter_posts/core/exceptions/http_exception.dart';
import 'package:flutter_posts/core/models/responses/user_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const _endpoint = 'https://jsonplaceholder.typicode.com';

  final client = http.Client();

  Future<UserResponse> fetchUser(int userId) async {
    final response = await client.get('$_endpoint/users/$userId');
    if (response.statusCode != 200) {
      throw HttpException();
    }
    return UserResponse.fromJson(json.decode(response.body));
  }
}
