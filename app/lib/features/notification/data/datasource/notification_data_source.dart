import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/notification/data/models/notification_model.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationDataSourceImpl implements NotificationDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  NotificationDataSourceImpl({
    required this.secureStorage,
    required this.client,
  });
  @override
  Future<List<NotificationModel>> getNotifications() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}notifications");
    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<NotificationModel> list =
          jsonresponse.map((item) => NotificationModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
