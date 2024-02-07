import 'package:tak/core/domain/entities/tenant_house_entity.dart';
import 'package:tak/features/setup/data/model/houses_model.dart';

class TenantHouseModel extends TenantHouseEntity {
  TenantHouseModel({
    required super.id,
    required super.houseId,
    required super.tenantId,
    required super.status,
    required super.house,
  });

  factory TenantHouseModel.fromJson(Map<String, dynamic> json) {
    HousesModel? house = HousesModel.fromJson(json['house']);
    return TenantHouseModel(
      id: json['id'],
      houseId: json['house_id'],
      tenantId: json['tenant_id'],
      status: json['status'],
      house: house,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "house_id": houseId,
      "tenant_id": houseId,
      "status": status,
      "house": house,
    };
  }
}
