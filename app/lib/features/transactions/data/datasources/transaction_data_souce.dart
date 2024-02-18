import 'dart:convert';

import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/error/execptions.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/transactions/data/model/balance_model.dart';
import 'package:tak/features/transactions/data/model/invoice_model.dart';
import 'package:tak/features/transactions/data/model/payment_model.dart';
import 'package:tak/features/transactions/data/model/transactions_model.dart';

abstract class TransactionDataSource {
  Future<BalanceModel> getBalance();
  Future<TransactionsModel> getTransactions();
  Future<TransactionsModel> getRents();
  Future<TransactionsModel> getServiceCharge();
  Future<List<InvoiceModel>> getInvoices(params);
  Future<List<PaymentModel>> getPayments(params);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  final SecureStorage secureStorage;
  final dynamic client;

  TransactionDataSourceImpl({
    required this.secureStorage,
    required this.client,
  });
  @override
  Future<BalanceModel> getBalance() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions/balance");
    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return BalanceModel.fromJson(data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TransactionsModel> getTransactions() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions");
    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return TransactionsModel.fromJson(data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<InvoiceModel>> getInvoices(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions/invoices");
    var response = await client.post(url, headers: headers, body: {
      'start_date': params.startDate,
      'end_date': params.endDate,
      "type": params.type,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];
      List<InvoiceModel> list =
          jsonresponse.map((item) => InvoiceModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PaymentModel>> getPayments(params) async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions/payments");
    var response = await client.post(url, headers: headers, body: {
      'start_date': params.startDate,
      'end_date': params.endDate,
      "type": params.type,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> jsonresponse = data['data'];

      List<PaymentModel> list =
          jsonresponse.map((item) => PaymentModel.fromJson(item)).toList();
      return list;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TransactionsModel> getRents() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions/rents");
    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return TransactionsModel.fromJson(data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TransactionsModel> getServiceCharge() async {
    final token = await secureStorage.getToken();
    if (token == null) throw ServerException();
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var url = Uri.parse("${endpoint}transactions/service-charge");
    var response = await client.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return TransactionsModel.fromJson(data['data']);
    } else {
      throw ServerException();
    }
  }
}
