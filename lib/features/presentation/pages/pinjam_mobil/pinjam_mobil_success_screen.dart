import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';

class PinjamMobilSuccessScreen extends StatelessWidget {
  const PinjamMobilSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(),
        ),
        body: Placeholder(),
      ),
    );
  }
}
