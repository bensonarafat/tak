class ServiceRequestsEntity {
  final int id;
  final String name;
  final String description;
  final int userId;
  final String priority;
  final String section;
  final List<dynamic> maintenance;
  final List<dynamic> location;
  final String status;
  final String updatedAt;

  ServiceRequestsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    required this.priority,
    required this.section,
    required this.maintenance,
    required this.location,
    required this.status,
    required this.updatedAt,
  });
}
