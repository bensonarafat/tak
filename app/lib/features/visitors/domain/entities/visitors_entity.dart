class VisitorsEntity {
  final int id;
  final String visitorName;
  final String? checkIn;
  final String? checkOut;
  final String arrival;
  final String departure;
  final String phone;

  VisitorsEntity({
    required this.id,
    required this.visitorName,
    required this.checkIn,
    required this.checkOut,
    required this.arrival,
    required this.departure,
    required this.phone,
  });
}
