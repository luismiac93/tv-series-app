import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tv_series_app/Auth/helpers/fake_api.dart';
import 'package:tv_series_app/Auth/models/user.dart';

class AuthRepository with ChangeNotifier {
  User? user;
  bool _authenticated = false;
  final _storage = new FlutterSecureStorage();

  bool get authenticated => _authenticated;

  set authenticated(bool valor) {
    _authenticated = valor;
    notifyListeners();
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String name, String password) async {
    authenticated = true;

    final resp = fakeApi(name, password);

    authenticated = false;
    if (resp) {
      user = User(name, "");
      await this._guardarToken(name);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token') ?? "";

    if (token.isNotEmpty) {
      user = User(token, "");
      await _guardarToken(token);
      return true;
    } else {
      logout();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }
}
