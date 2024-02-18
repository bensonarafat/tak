class InvoiceEntity {
  final int id;
  final String invoiceNo;
  final int tenantId;
  final String endDate;
  final int rentId;
  final int status;
  final String amount;
  final String type;
  final int houseId;
  final String createdAt;

  InvoiceEntity({
    required this.id,
    required this.invoiceNo,
    required this.tenantId,
    required this.endDate,
    required this.rentId,
    required this.status,
    required this.amount,
    required this.type,
    required this.houseId,
    required this.createdAt,
  });
}
