import 'package:flutter/material.dart';

class DetailDataDesc extends StatelessWidget {
  const DetailDataDesc({
    required this.desc,
    super.key,
  });
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
