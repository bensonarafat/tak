import 'package:tak/core/domain/entities/tenant_house_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String? role;
  final String status;
  final String? emailVerifiedAt;
  final TenantHouseEntity? tenantHouse;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.role,
    required this.status,
    required this.emailVerifiedAt,
    required this.tenantHouse,
  });
}
