import 'package:flutter/material.dart';
import 'package:flutter_posts/core/constants/route_path.dart';
import 'package:flutter_posts/ui/screens/login_screen.dart';
import 'package:flutter_posts/ui/screens/posts_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case RoutePath.posts:
        return MaterialPageRoute(
          builder: (_) => PostsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
