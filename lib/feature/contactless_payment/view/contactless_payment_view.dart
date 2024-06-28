import 'package:cloud_walk_case/design_system/widgets/final_value_widget.dart';
import 'package:cloud_walk_case/entity/general/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactlessPaymentView extends StatefulWidget {
  const ContactlessPaymentView({super.key});

  @override
  State<ContactlessPaymentView> createState() => _ContactlessPaymentViewState();
}

class _ContactlessPaymentViewState extends State<ContactlessPaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: WidgetStateColor.transparent,
        title: const Text('Contactless Payment'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FinalValueWidget(
              valueCents: context.read<TransactionDetails>().valueCents,
            ),
            const SizedBox(height: 36),
            const Text(
              'Approach your card or phone here',
              textAlign: TextAlign.center,
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

  void _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
