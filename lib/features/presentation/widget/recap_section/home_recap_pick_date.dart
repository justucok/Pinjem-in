import 'package:flutter/material.dart';

class HomeRecapPickDate extends StatelessWidget {
  const HomeRecapPickDate({
    required this.value,
    required this.index,
    required this.items,
    super.key,
  });
  final int value;
  final int index;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 109,
      decoration: BoxDecoration(
        color: value == index ? const Color(0xff0C6898) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          items[index],
          style: TextStyle(
            color: value == index ? Colors.white : const Color(0xffB2B2B2),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
