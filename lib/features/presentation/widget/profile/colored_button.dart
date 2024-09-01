// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    required this.borderColor,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
    required this.onTap,
    super.key,
  });
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final dynamic Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
