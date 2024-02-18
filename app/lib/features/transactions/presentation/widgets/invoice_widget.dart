import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/core/widgets/tak_error_widget.dart';
import 'package:tak/features/home/presentation/widgets/transaction_widget_debit.dart';
import 'package:tak/features/transactions/domain/entities/invoice_entity.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (pre, state) {
        return state is InvoiceTransactionLoading ||
            state is InvoiceTransactionLoaded ||
            state is InvoiceTransactionError;
      },
      builder: (context, state) {
        if (state is InvoiceTransactionLoading) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is InvoiceTransactionLoaded) {
          List<InvoiceEntity> invoices = state.invoiceEntity;
          if (invoices.isEmpty) {
            return const Center(
              child: Text("No Invoice transaction yet"),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: ListView.builder(
                itemCount: invoices.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TransactionWidgetDebit(
                    invoice: invoices[index],
                  );
                },
              ),
            );
          }
        } else if (state is InvoiceTransactionError) {
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
