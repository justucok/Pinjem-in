import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinjem_in_app/app/config/routes/routes.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/l10n/l10n.dart';

class App extends StatelessWidget {
  App({this.token, super.key});

  final String? token;
  final route = MyRoutes();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: route.onRoute,
      initialRoute: token != null ? '/home' : '/',
      locale: const Locale('id', 'ID'),
    );
  }
}
