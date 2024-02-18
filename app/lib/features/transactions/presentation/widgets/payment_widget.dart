import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/core/widgets/tak_error_widget.dart';
import 'package:tak/features/home/presentation/widgets/transaction_widget_credit.dart';
import 'package:tak/features/transactions/domain/entities/payment_entity.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (pre, state) {
        return state is PaymentTransactionLoading ||
            state is PaymentTransactionLoaded ||
            state is PaymentTransactionError;
      },
      builder: (context, state) {
        if (state is PaymentTransactionLoading) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is PaymentTransactionLoaded) {
          List<PaymentEntity> payments = state.paymentEntity;
          if (payments.isEmpty) {
            return const Center(
              child: Text("No payment transaction yet"),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: ListView.builder(
                itemCount: payments.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TransactionWidgetCredit(
                    payment: payments[index],
                  );
                },
              ),
            );
          }
        } else if (state is PaymentTransactionError) {
          return const TakErrorWidget();
        } else {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        }
      },
    );
  }
}
