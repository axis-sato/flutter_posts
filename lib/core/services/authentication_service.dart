import 'package:flutter_posts/core/exceptions/login_failure.dart';
import 'package:flutter_posts/core/models/entities/user.dart';
import 'package:flutter_posts/core/repositories/user_repository.dart';
import 'package:flutter_posts/core/exceptions/http_exception.dart';

class AuthenticationService {
  UserRepository _userRepository;

  AuthenticationService({UserRepository userRepository})
      : _userRepository = userRepository;

  Future<User> login(int userId) async {
    try {
      final user = await _userRepository.getUser(userId);
      return user;
    } on HttpException catch (e) {
      throw LoginFailure();
    }
  }
}
