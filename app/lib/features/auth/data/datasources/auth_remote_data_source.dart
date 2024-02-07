import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/auth/data/models/auth_model.dart';
import 'package:tak/features/auth/data/models/logout_model.dart';
import 'package:tak/features/auth/data/models/email_model.dart';
import 'package:tak/features/auth/data/models/verify_otp_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> createAccount({required params});
  Future<EmailModel> email({required params});
  Future<VerifyOTPModel> verifyOTP({required params});
  Future<LogoutModel> logout();
  Future<AuthModel> login({required params});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final dynamic client;
  final SecureStorage secureStorage;

  AuthRemoteDataSourceImpl({
    required this.client,
    required this.secureStorage,
  });

  @override
  Future<AuthModel> createAccount({required params}) async {
    var headers = {
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}auth/register");
    var response = await client.post(
      url,
      body: {
        "name": params.fullname,
        "password": params.password,
        "email": params.email,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return AuthModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EmailModel> email({required params}) async {
    var url = Uri.parse("${endpoint}auth/email");
    var response = await client.post(
      url,
      body: {"email": params.email},
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return EmailModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VerifyOTPModel> verifyOTP({required params}) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    var url = Uri.parse("${endpoint}auth/verify");
    var response = await client.post(
      url,
      body: {
        "otp": params.otp,
        "email": params.email,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return VerifyOTPModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LogoutModel> logout() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}auth/logout");
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return LogoutModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> login({required params}) async {
    var headers = {
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}auth/login");
    var response = await client.post(
      url,
      body: {
        "email": params.email,
        "password": params.password,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return AuthModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
