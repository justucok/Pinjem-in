import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/auth_header.dart';
import 'package:pinjem_in_app/features/presentation/widget/reset_pass/reset_textformfield.dart';
import 'package:pinjem_in_app/features/presentation/widget/reset_pass/send_button.dart';

class ResetPassScreen extends StatelessWidget {
  ResetPassScreen({super.key});

  final GlobalKey<FormState> resKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: resKey,
            child: ListView(
              children: [
                const AuthHeader(),
                const SizedBox(
                  height: 10,
                ),
                ResetTextFormField(),
                const SizedBox(
                  height: 20,
                ),
                SendButton(
                  onPressed: () {
                    if (resKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed('/emailConfirm');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
