import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/setup/data/model/account_select_model.dart';
import 'package:tak/features/setup/data/model/houses_model.dart';
import 'package:tak/features/setup/domain/usecases/select_house_usecase.dart';

abstract class SetupRemoteDataSource {
  Future<AccountSelectModel> selectAccount(params);
  Future<AccountSelectModel> selectHouse(SelectHouseParams params);
  Future<List<HousesModel>> fetchHouses();
}

class SetupRemoteDataSourceImp implements SetupRemoteDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  SetupRemoteDataSourceImp({
    required this.secureStorage,
    required this.client,
  });
  @override
  Future<AccountSelectModel> selectAccount(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}account/role");
    var response = await client.post(
      url,
      body: {
        "role": params.role.toLowerCase(),
        "status": params.status,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return AccountSelectModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AccountSelectModel> selectHouse(SelectHouseParams params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}houses/select");
    var response = await client.post(
      url,
      body: {
        "house_id": params.houseId,
        "status": params.status,
        "role": params.role,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return AccountSelectModel.fromJson(data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<HousesModel>> fetchHouses() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}houses");
    var response = await client.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<HousesModel> list =
          jsonresponse.map((item) => HousesModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }
}
