import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  // keys
  static const String _userModelKey = "userModelKey";
  static const String _jwtKey = "jwtKey";
  static const String _otpKey = "OtpKey";
  static const String _phoneKey = "OtpKey";

  // token
  Future<String> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_jwtKey) ?? "";
  }

  Future<void> setToken(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_jwtKey, value);
  }

  // otp
  Future<String> getOtp() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_otpKey) ?? "";
  }

  Future<void> setOtp(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_otpKey, value);
  }

  // otp
  Future<String> getPhone() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_phoneKey) ?? "";
  }

  Future<void> setPhone(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_phoneKey, value);
  }

  // user model
  Future<String> getUserModel() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_userModelKey) ?? "";
  }

  Future<void> setUserModel(String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(_userModelKey, value);
  }

  Future<void> destroySharedPreferences() async {
    Logger().i("SharedPreferences destroyed");
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    Logger().i("SharedPreferences destroyed");
  }
}
