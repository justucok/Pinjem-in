import 'package:flutter/material.dart';

class HomeRecapDate extends StatelessWidget {
  const HomeRecapDate({
    required this.dateStart,
    required this.dateEnd,
    super.key,
  });

  final String dateStart;
  final String dateEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateStart,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          '-',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          dateEnd,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
