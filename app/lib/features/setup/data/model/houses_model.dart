import 'package:tak/features/setup/domain/entities/house_entity.dart';

class HousesModel extends HousesEntity {
  HousesModel({
    required super.id,
    required super.name,
    required super.houseNo,
    required super.furnitures,
    required super.description,
  });

  factory HousesModel.fromJson(Map<String, dynamic> json) {
    return HousesModel(
      id: json['id'],
      name: json['name'],
      houseNo: json['house_no'],
      furnitures: json['furnitures'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "house_no": houseNo,
      "furnitures": furnitures,
      "description": description,
    };
  }
}
