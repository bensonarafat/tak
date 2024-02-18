class PaymentEntity {
  final int id;
  final int tenantId;
  final int houseId;
  final int invoiceId;
  final String paymentType;
  final int charge;
  final int amount;
  final int balance;
  final String paymentMethod;
  final String preparedBy;
  final String currency;
  final String description;
  final String type;
  final String? lastPaymentDate;
  final int status;
  final String createdAt;

  PaymentEntity({
    required this.id,
    required this.tenantId,
    required this.houseId,
    required this.invoiceId,
    required this.paymentType,
    required this.charge,
    required this.amount,
    required this.balance,
    required this.paymentMethod,
    required this.preparedBy,
    required this.currency,
    required this.description,
    required this.type,
    required this.lastPaymentDate,
    required this.status,
    required this.createdAt,
  });
}
