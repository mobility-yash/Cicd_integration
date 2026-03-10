import 'package:checklist/screens/checklist/views/checklist_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

void main() {
  startApp("prod");
}

void startApp(String flavor) {
  if (kDebugMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
  runApp(MyApp(flavor: flavor));
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final String flavor;

  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Checklist ($flavor)",
      home: ChecklistScreen(),
    );
  }
}