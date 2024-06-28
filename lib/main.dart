import 'package:cloud_walk_case/design_system/themes/app_theme.dart';
import 'package:cloud_walk_case/entity/general/transaction_details.dart';
import 'package:cloud_walk_case/feature/payment_selection/view/payment_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CloudWalk Case',
      theme: theme,
      home: Provider.value(
        value: const TransactionDetails(
          description: 'Description?',
          valueCents: 420000,
        ),
        builder: (context, child) => const PaymentSelectionView(),
      ),
    );
  }
}
