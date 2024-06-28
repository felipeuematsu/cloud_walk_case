import 'package:flutter/material.dart';

class PixButton extends StatelessWidget {
  const PixButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: const Text('Pay with Pix'),
      icon: Image.asset('assets/png/pix.png', height: 24, width: 24),
    );
  }
}
