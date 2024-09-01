import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.preIcon,
    required this.labelText,
    required this.onpressed,
    required this.index,
    required this.value,
    super.key,
  });

  final IconData preIcon;
  final String labelText;
  final int index;
  final int value;
  final void Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: value == index ? primaryColor : Colors.white,
          foregroundColor: value == index ? primaryColor : Colors.white,
          alignment: Alignment.centerLeft,
        ),
        onPressed: onpressed,
        icon: Icon(
          preIcon,
          color: value == index ? Colors.white : Colors.grey,
        ),
        label: Text(
          labelText,
          style: buttonTextStyle.copyWith(
            fontSize: 16,
            color: value == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
