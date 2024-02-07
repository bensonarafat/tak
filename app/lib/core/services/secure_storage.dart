import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tak/core/data/models/user_model.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt');
  }

  Future<bool> isTokenSave() async {
    String? authToken = await _storage.read(key: 'jwt');
    return authToken != null && authToken.isNotEmpty;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt');
  }

  Future<void> saveUserData(UserModel data) async {
    await _storage.write(key: "user", value: json.encode(data.toJson()));
  }

  Future<UserModel?> getUserData() async {
    final jsondata = await _storage.read(key: "user");

    if (jsondata != null) {
      final userData = json.decode(jsondata);
      return UserModel.fromJson(userData);
    } else {
      return null;
    }
  }

  Future<void> deleteUser() async {
    await _storage.delete(key: 'user');
  }
}
