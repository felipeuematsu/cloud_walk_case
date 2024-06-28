import 'package:cloud_walk_case/design_system/widgets/final_value_widget.dart';
import 'package:cloud_walk_case/entity/general/transaction_details.dart';
import 'package:cloud_walk_case/feature/card_payment/view/card_payment_view.dart';
import 'package:cloud_walk_case/feature/contactless_payment/view/contactless_payment_view.dart';
import 'package:cloud_walk_case/feature/payment_selection/widgets/card_button.dart';
import 'package:cloud_walk_case/feature/payment_selection/widgets/contactless_button.dart';
import 'package:cloud_walk_case/feature/payment_selection/widgets/pix_button.dart';
import 'package:cloud_walk_case/feature/pix_payment/view/pix_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSelectionView extends StatelessWidget {
  const PaymentSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionDetails = context.read<TransactionDetails>();
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FinalValueWidget(valueCents: transactionDetails.valueCents),
            const SizedBox(height: 36),
            const Text('Select a payment option', textAlign: TextAlign.center),
            const SizedBox(height: 36),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 3,
              itemBuilder: (context, index) => switch (index) {
                0 =>
                  ContactlessButton(onPressed: () => _onContactless(context)),
                1 => CardButton(onPressed: () => _onCard(context)),
                2 => PixButton(onPressed: () => _onPix(context)),
                int() => const SizedBox(),
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _onCancel(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  void _onContactless(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Provider.value(
          value: context.read<TransactionDetails>(),
          child: const ContactlessPaymentView(),
        ),
      ),
    );
  }

  void _onCard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Provider.value(
          value: context.read<TransactionDetails>(),
          child: const CardPaymentView(),
        ),
      ),
    );
  }

  void _onPix(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Provider.value(
          value: context.read<TransactionDetails>(),
          child: const PixPayment(),
        ),
      ),
    );
  }

  void _onCancel(BuildContext context) {
    // Navigator.of(context).pop();
  }
}
