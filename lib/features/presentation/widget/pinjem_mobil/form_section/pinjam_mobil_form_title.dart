import 'package:flutter/material.dart';

class PinjamMobilFormTitle extends StatelessWidget {
  const PinjamMobilFormTitle({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff404040),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
