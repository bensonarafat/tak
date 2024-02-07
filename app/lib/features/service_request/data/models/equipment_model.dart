import 'package:tak/features/service_request/domain/entities/equipment_entity.dart';

class EquipmentModel extends EquipmentEntity {
  EquipmentModel({required super.id, required super.name});

  factory EquipmentModel.fromJson(Map<String, dynamic> json) {
    return EquipmentModel(id: json['id'], name: json['name']);
  }
}
