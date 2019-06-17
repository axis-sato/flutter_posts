import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_posts/core/models/entities/user.dart';
import 'package:flutter_posts/core/services/authentication_service.dart';
import 'package:flutter_posts/core/exceptions/login_failure.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;
  String validationMessage;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  Future<Result<User>> login(String userIdText) async {
    final userId = int.tryParse(userIdText);

    try {
      final user = await _authenticationService.login(userId);
      return Result.value(user);
    } on LoginFailure catch (e) {
      validationMessage = '$e';
      notifyListeners();
      return Result.error(e);
    }
  }
}
