import 'package:flutter_posts/core/exceptions/http_exception.dart';
import 'package:flutter_posts/core/models/entities/user.dart';
import 'package:flutter_posts/core/models/responses/user_response.dart';
import 'package:flutter_posts/core/repositories/api/api_client.dart';
import 'package:flutter_posts/core/repositories/user_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  ApiClient apiClient;

  setUp(() {
    print('setup');
    apiClient = MockApiClient();
  });

  group('getUser', () {
    test('ユーザが取得できること', () async {
      final userId = 1;

      when(apiClient.fetchUser(userId)).thenAnswer(
          (_) async => UserResponse(id: userId, name: 'foo', username: 'bar'));

      final userRepository = UserRepository(apiClient: apiClient);

      final user = await userRepository.getUser(userId);
      expect(user, isA<User>());
      expect(user.id, same(userId));
    });

    test('HttpExceptionを投げること', () async {
      final userId = 1;

      when(apiClient.fetchUser(userId)).thenThrow(HttpException());

      final userRepository = UserRepository(apiClient: apiClient);

      expect(
        await userRepository.getUser(userId),
        throwsA(TypeMatcher<HttpException>()),
      );
    });
  });
}
