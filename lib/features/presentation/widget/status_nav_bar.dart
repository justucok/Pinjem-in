import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

// ignore: must_be_immutable
class StatusNavBar extends StatelessWidget {
  StatusNavBar({
    required this.onTap,
    required this.title1,
    super.key,
    this.title2,
  });

  final String title1;
  final String? title2;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
            child: Text(
              'Home',
              style: hintTextStyle.copyWith(fontSize: 14),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: secondaryTextColor,
            size: 16,
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              title1,
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: secondaryTextColor,
            size: 16,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            title2!,
            style: secondaryTextStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
