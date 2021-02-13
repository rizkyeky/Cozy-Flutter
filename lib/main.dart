import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp, Transition;

import 'injector.dart';
import 'theme.dart';
import 'view/page/page.dart';


Future<void> main() async {
  await injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      title: 'Kos App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: palettes['primary'],
        accentColor: palettes['accent'],
      ),
      home: HomePage(),
    );
  }
}