import 'package:flutter/material.dart';
import 'package:ravekb/constants/app_strings.dart';
import 'package:ravekb/views/home/home_view.dart';
import 'package:ravekb/constants/global_keys.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: navigatorKey,
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
