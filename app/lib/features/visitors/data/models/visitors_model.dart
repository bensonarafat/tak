import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';

class VisitorsModel extends VisitorsEntity {
  VisitorsModel(
      {required super.id,
      required super.visitorName,
      required super.checkIn,
      required super.checkOut,
      required super.arrival,
      required super.departure,
      required super.phone});

  factory VisitorsModel.fromJson(Map<String, dynamic> json) {
    return VisitorsModel(
        id: json['id'],
        visitorName: json['visitor_name'],
        checkIn: json['check-in'],
        checkOut: json['check-out'],
        arrival: json['arrival'],
        departure: json['departure'],
        phone: json['phone']);
  }
}
