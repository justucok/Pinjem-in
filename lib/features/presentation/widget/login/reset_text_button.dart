import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class ResetTextButton extends StatelessWidget {
  const ResetTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/reset');
        },
        child: Text(
          'Lupa password ?',
          style: linkTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
