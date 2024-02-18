import 'package:dartz/dartz.dart';
import 'package:tak/core/connection/network_info.dart';
import 'package:tak/core/error/failure.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/features/transactions/data/datasources/transaction_data_souce.dart';
import 'package:tak/features/transactions/data/model/balance_model.dart';
import 'package:tak/features/transactions/data/model/invoice_model.dart';
import 'package:tak/features/transactions/data/model/payment_model.dart';
import 'package:tak/features/transactions/data/model/transactions_model.dart';
import 'package:tak/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionDataSource remoteDataSource;
  NetworkInfo networkInfo;
  SecureStorage secureStorage;

  TransactionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.secureStorage,
  });
  @override
  Future<Either<Failure, BalanceModel>> getBalance() async {
    if (await networkInfo.isConnected) {
      try {
        BalanceModel model = await remoteDataSource.getBalance();
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<InvoiceModel>>> getInvoice(params) async {
    if (await networkInfo.isConnected) {
      try {
        List<InvoiceModel> model = await remoteDataSource.getInvoices(params);
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<PaymentModel>>> getPayments(params) async {
    if (await networkInfo.isConnected) {
      try {
        List<PaymentModel> model = await remoteDataSource.getPayments(params);
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, TransactionsModel>> getRents() async {
    if (await networkInfo.isConnected) {
      try {
        TransactionsModel model = await remoteDataSource.getRents();
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, TransactionsModel>> getServiceCharge() async {
    if (await networkInfo.isConnected) {
      try {
        TransactionsModel model = await remoteDataSource.getServiceCharge();
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }

  @override
  Future<Either<Failure, TransactionsModel>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        TransactionsModel model = await remoteDataSource.getTransactions();
        return Right(model);
      } catch (_) {
        return Left(ServerFailure(message: 'There is a server Error!'));
      }
    } else {
      return Left(
          NetworkFailure(message: 'Please check your internet connection'));
    }
  }
}
