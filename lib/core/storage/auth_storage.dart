import 'package:get_storage/get_storage.dart';

class AuthStorage {
  final _box = GetStorage();

  static const _tokenKey = 'token';

  void saveToken(String token) {
    _box.write(_tokenKey, token);
  }

  void saveLoginStatus(bool status) {
    _box.write('isloggedin', status);
  }

  String? getToken() {
    return _box.read(_tokenKey);
  }

  void clearToken() {
    _box.remove(_tokenKey);
  }
}
