import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoggedIn;

  UserProvider(this._isLoggedIn);

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    _isLoggedIn = false;
    notifyListeners();
  }
}
