import 'package:tak/features/setup/domain/entities/house_entity.dart';

class TenantHouseEntity {
  final int id;
  final int houseId;
  final int? tenantId;
  final String status;
  final HousesEntity? house;

  TenantHouseEntity({
    required this.id,
    required this.houseId,
    required this.tenantId,
    required this.status,
    required this.house,
  });
}
