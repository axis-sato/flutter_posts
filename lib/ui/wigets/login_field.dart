import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  LoginField({@required this.controller, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Login'),
        Text('1から10のユーザIDを入力してください。'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          height: 50.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'User Id'),
            keyboardType: TextInputType.number,
            controller: controller,
          ),
        ),
        validationMessage != null
            ? Text(
                validationMessage,
                style: TextStyle(color: Colors.red),
              )
            : Container(),
      ],
    );
  }
}
