import 'package:tak/features/service_request/domain/entities/service_request_entity.dart';

class ServiceRequestModel extends ServiceRequestEntity {
  ServiceRequestModel({required super.status, required super.message});

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) {
    return ServiceRequestModel(
        status: json['status'], message: json['message']);
  }
}
