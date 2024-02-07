import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/visitors/data/models/visitor_model.dart';
import 'package:tak/features/visitors/data/models/visitors_model.dart';
import 'package:tak/features/visitors/domain/usecases/add_visitor_usecase.dart';

abstract class VisitorDataSource {
  Future<VisitorModel> addVisitor(VisitorParams params);
  Future<VisitorModel> editVisitor(params);
  Future<List<VisitorsModel>> getVisitors();
}

class VisitorDataSourceImpl implements VisitorDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  VisitorDataSourceImpl({
    required this.secureStorage,
    required this.client,
  });

  @override
  Future<VisitorModel> addVisitor(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}visitors/create");
    var response = await client.post(
      url,
      body: {
        "phone": params.phone,
        "arrival": params.arrival,
        "departure": params.departure,
        "car_regno": params.carRegno,
        "reason": params.reason,
        "destination": params.destination,
        "visitor_name": params.visitorName,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return VisitorModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VisitorModel> editVisitor(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}visitors/update/${params.id}");
    var response = await client.put(
      url,
      body: {
        "phone": params.phone,
        "arrival": params.arrival,
        "departure": params.departure,
        "car_regno": params.carRegno,
        "reason": params.reason,
        "destination": params.destination,
        "vistor_name": params.vistorName,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return VisitorModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<VisitorsModel>> getVisitors() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}visitors");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<VisitorsModel> list =
          jsonresponse.map((item) => VisitorsModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
