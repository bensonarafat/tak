import 'dart:convert';

import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';

class ServiceRequestsModel extends ServiceRequestsEntity {
  ServiceRequestsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.userId,
    required super.priority,
    required super.section,
    required super.maintenance,
    required super.location,
    required super.status,
    required super.updatedAt,
  });

  factory ServiceRequestsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> location = jsonDecode(json['location']);
    List<dynamic> maintenance = jsonDecode(json['maintenance']);

    return ServiceRequestsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      userId: json['user_id'],
      priority: json['priority'],
      section: json['section'],
      maintenance: maintenance,
      location: location,
      status: json['status'],
      updatedAt: json['updated_at'],
    );
  }
}
