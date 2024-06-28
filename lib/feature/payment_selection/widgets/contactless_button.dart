import 'package:flutter/material.dart';

class ContactlessButton extends StatelessWidget {
  const ContactlessButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Contactless payment'),
    );
  }
}
