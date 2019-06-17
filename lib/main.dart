import 'package:flutter/material.dart';
import 'package:flutter_posts/core/constants/route_path.dart';
import 'package:flutter_posts/core/repositories/api/api_client.dart';
import 'package:flutter_posts/core/repositories/user_repository.dart';
import 'package:flutter_posts/core/services/authentication_service.dart';
import 'package:flutter_posts/core/viewmodels/screens/login_view_model.dart';
import 'package:flutter_posts/ui/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => ApiClient(),
          dispose: (_, apiClient) => apiClient.dispose(),
        ),
        ProxyProvider<ApiClient, UserRepository>(
          builder: (_, apiClient, previous) =>
              (previous ?? UserRepository(apiClient: apiClient)),
        ),
        ProxyProvider<UserRepository, AuthenticationService>(
          builder: (_, userRepository, previous) => (previous ??
              AuthenticationService(userRepository: userRepository)),
        ),
        ChangeNotifierProxyProvider<AuthenticationService, LoginViewModel>(
          builder: (_, authenticationService, previous) => (previous ??
              LoginViewModel(authenticationService: authenticationService)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Posts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePath.login,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
