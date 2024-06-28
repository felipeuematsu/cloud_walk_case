import 'package:cloud_walk_case/design_system/themes/app_theme.dart';
import 'package:cloud_walk_case/design_system/widgets/final_value_widget.dart';
import 'package:cloud_walk_case/entity/general/transaction_details.dart';
import 'package:cloud_walk_case/feature/pix_payment/viewmodel/pix_payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PixPayment extends StatefulWidget {
  const PixPayment({super.key});

  @override
  State<PixPayment> createState() => _PixPaymentState();
}

class _PixPaymentState extends State<PixPayment> {
  final PixPaymentViewModel viewModel = PixPaymentViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pix')),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider.value(
          value: viewModel,
          builder: (context, child) {
            final viewModel = context.watch<PixPaymentViewModel>();

            final qrCode = viewModel.qrCode;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FinalValueWidget(
                  valueCents: context.read<TransactionDetails>().valueCents,
                ),
                if (qrCode != null) ...[
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: AspectRatio(aspectRatio: 1, child: Placeholder()),
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton.icon(
                      style: secondaryElevatedButtonThemeData.style,
                      onPressed: () => _copyCode(context, qrCode),
                      icon: const Icon(Icons.copy),
                      label: const Text('Copy to clipboard')),
                  const Spacer(),
                ] else ...[
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  )
                ],
                ElevatedButton(
                  onPressed: () => _cancel(context),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _copyCode(BuildContext context, String qrCode) {
    Clipboard.setData(ClipboardData(text: qrCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard: $qrCode')),
    );
  }

  void _cancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
