import 'package:flutter/material.dart';

class Num2 extends StatelessWidget {
  const Num2({
    required this.fullColor,
    super.key,
  });

  final bool fullColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 3,
          color: fullColor ? Colors.transparent : const Color(0xff034E76),
        ),
        color: fullColor ? const Color(0xff034E76) : Colors.transparent,
      ),
      child: Center(
        child: Text(
          '2',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fullColor ? Colors.white : const Color(0xff034E76),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
