import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/messages/data/models/message_model.dart';

abstract class MessageDataSource {
  Future<List<MessageModel>> getMessages();
}

class MessageDataSourceImpl implements MessageDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  MessageDataSourceImpl({
    required this.secureStorage,
    required this.client,
  });
  @override
  Future<List<MessageModel>> getMessages() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}messages");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<dynamic> jsonresponse = data['data'];

      List<MessageModel> list =
          jsonresponse.map((item) => MessageModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
