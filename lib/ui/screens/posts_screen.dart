import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ポスト一覧'),
      ),
      body: Center(
        child: Text('posts'),
      ),
    );
  }
}
