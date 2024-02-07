import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/service_request/data/models/equipment_model.dart';
import 'package:tak/features/service_request/data/models/service_request_model.dart';
import 'package:tak/features/service_request/data/models/service_requests_model.dart';
import 'package:tak/features/service_request/domain/usecases/add_request_usecase.dart';
import 'package:tak/features/service_request/domain/usecases/edit_request_usecase.dart';

abstract class ServiceRequestDataSource {
  Future<ServiceRequestModel> addRequest(ServiceRequestParams params);
  Future<ServiceRequestModel> editRequest(EditServiceRequestParams params);
  Future<List<EquipmentModel>> getEquipments(params);
  Future<List<ServiceRequestsModel>> getServiceRequests();
}

class ServiceRequestDataSourceImp extends ServiceRequestDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  ServiceRequestDataSourceImp({
    required this.secureStorage,
    required this.client,
  });

  @override
  Future<ServiceRequestModel> addRequest(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}services/create");

    var response = await client.post(
      url,
      body: {
        'description': params.description,
        'name': params.name,
        'priority': params.priority,
        'houseId': params.houseId,
        'section': params.section,
        'location': jsonEncode(params.location),
        'maintenance': jsonEncode(params.maintenance),
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return ServiceRequestModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ServiceRequestModel> editRequest(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}services/update/${params.id}");
    var response = await client.put(
      url,
      body: {
        "description": params.description,
        "name": params.name,
        "priority": params.priority,
        'section': params.section,
        'location': jsonEncode(params.location),
        'maintenance': jsonEncode(params.maintenance),
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return ServiceRequestModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EquipmentModel>> getEquipments(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}equipments/${params.houseId}");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<EquipmentModel> list =
          jsonresponse.map((item) => EquipmentModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ServiceRequestsModel>> getServiceRequests() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}services");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<ServiceRequestsModel> list = jsonresponse
          .map((item) => ServiceRequestsModel.fromJson(item))
          .toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
