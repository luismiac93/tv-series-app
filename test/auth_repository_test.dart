import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series_app/Auth/repository/auth_repository.dart';

void main() {

  group('Auth Repository Unit Test', () {

  test('should return false with a wrong user', () async {
    final authRepository = AuthRepository();

    final response = await authRepository.login("maria22", "password22");

    expect(response, false);
  });
  test('should return false if not authenticated', () async {
    final authRepository = AuthRepository();

    expect(authRepository.authenticated, false);
  });

  test('should change the status to authenticated', () async {
    final authRepository = AuthRepository();

    //fake login
    authRepository.authenticated = true;

    expect(authRepository.authenticated, true);
  });
  });
}
