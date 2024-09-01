import 'package:flutter/material.dart';

class PinjamMobilFormHeading extends StatelessWidget {
  const PinjamMobilFormHeading({
    required this.heading,
    super.key,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(
        color: Color(0xff0C6898),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
