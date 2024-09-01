import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/app.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';
import 'package:pinjem_in_app/bootstrap.dart';

String? token = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  token = await SharedPrefStore.getBearerToken();
  await bootstrap(
    App(token: token),
  );
}
