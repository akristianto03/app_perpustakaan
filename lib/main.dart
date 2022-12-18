import 'dart:io';

import 'package:app_perpustakaan/views/pages/pages.dart';
import 'package:app_perpustakaan/views/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  enablePlatformOverrideForDesktop();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

const bool kIsWeb = identical(0, 0.0);

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Perpustakaan Fredo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      getPages: RoutePages.pages,
    );
  }
}
