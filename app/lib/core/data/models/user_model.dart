import 'package:tak/core/data/models/tenant_house_model.dart';
import 'package:tak/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.avatar,
    required super.role,
    required super.status,
    required super.emailVerifiedAt,
    required super.tenantHouse,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    TenantHouseModel? tenantHouse;
    if (json['tenant_house'] != null) {
      tenantHouse = TenantHouseModel.fromJson(json['tenant_house']);
    }

    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      role: json['role'],
      status: json['status'],
      emailVerifiedAt: json['email_verified_at'],
      tenantHouse: tenantHouse,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "avatar": avatar,
      "role": role,
      "status": status,
      'email_verified_at': emailVerifiedAt,
      'tenant_house': tenantHouse,
    };
  }
}
