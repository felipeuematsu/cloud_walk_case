import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinalValueWidget extends StatelessWidget {
  const FinalValueWidget({super.key, required this.valueCents});

  final int valueCents;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      height: 48,
      child: FittedBox(

        child: Text(
          formatter.format(valueCents / 100),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
