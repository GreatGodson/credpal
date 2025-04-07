import 'package:credpal/modules/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'core/framework/navigator/navigator.dart';
import 'core/framework/utils/font.dart';
import 'core/framework/utils/spacings.dart';
import 'injectable.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigator.navigatorKey,
      title: 'Credpal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.avenir,
        scaffoldBackgroundColor: const Color(0xffF2F2F2),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 2,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: Spacings.spacing80,
        ),
      ),
      home: DashboardPage(),
    );
  }
}
