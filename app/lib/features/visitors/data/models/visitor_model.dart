import 'package:tak/features/visitors/domain/entities/visitor_entity.dart';

class VisitorModel extends VisitorEntity {
  VisitorModel({required super.status, required super.message});

  factory VisitorModel.fromJson(Map<String, dynamic> json) {
    return VisitorModel(status: json['status'], message: json['message']);
  }
}
