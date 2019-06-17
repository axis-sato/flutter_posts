import 'package:flutter/material.dart';
import 'package:flutter_posts/core/constants/route_path.dart';
import 'package:flutter_posts/core/viewmodels/screens/login_view_model.dart';
import 'package:flutter_posts/ui/wigets/login_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_posts/core/exceptions/login_failure.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ログイン'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginField(
                controller: _controller,
                validationMessage: vm.validationMessage,
              ),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  try {
                    final _ = await vm.login(_controller.text);
                    Navigator.pushNamed(context, RoutePath.posts);
                  } on LoginFailure catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
