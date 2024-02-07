import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/security/data/models/check_model.dart';
import 'package:tak/features/security/data/models/security_visitors_model.dart';

abstract class SecurityDataSource {
  Future<List<SecurityVisitorModel>> getVisitors();
  Future<CheckModel> checkIn(params);
  Future<CheckModel> checkOut(params);
}

class SecurityDataSourceImpl implements SecurityDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  SecurityDataSourceImpl({
    required this.secureStorage,
    required this.client,
  });

  @override
  Future<List<SecurityVisitorModel>> getVisitors() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}visitors/security");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> jsonresponse = data['data'];
      List<SecurityVisitorModel> list = jsonresponse
          .map((item) => SecurityVisitorModel.fromJson(item))
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CheckModel> checkIn(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url =
        Uri.parse("${endpoint}visitors/security/check-in/${params.visitorId}");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return CheckModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CheckModel> checkOut(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url =
        Uri.parse("${endpoint}visitors/security/check-out/${params.visitorId}");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return CheckModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }
}
