import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 90,
      margin: const EdgeInsets.only(bottom: 30),
      child: Center(
        child: Container(
          height: 5,
          color: const Color(0xffD9D9D9),
        ),
      ),
    );
  }
}
