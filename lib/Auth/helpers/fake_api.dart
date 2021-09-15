import 'package:tv_series_app/Auth/models/user.dart';

final List<User> userfake = [
  User("maria", "password"),
  User("pedro", "123456"),
];

bool fakeApi(String name, String password) {
  try {
    final user =
        userfake.any((user) => user.name == name && user.password == password);
    if (user) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
