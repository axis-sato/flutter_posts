import 'package:flutter_posts/core/models/entities/user.dart';
import 'package:flutter_posts/core/repositories/api/api_client.dart';
import 'package:flutter_posts/core/exceptions/http_exception.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({ApiClient apiClient}) : _apiClient = apiClient;

  Future<User> getUser(int userId) async {
    try {
      final userResponse = await _apiClient.fetchUser(userId);

      return User(
        id: userResponse.id,
        name: userResponse.name,
        username: userResponse.username,
      );
    } on HttpException catch (e) {
      print(e);
      rethrow;
    }
  }
}
