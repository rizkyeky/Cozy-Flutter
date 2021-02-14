import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp, Transition;

import 'theme.dart';
import 'view/page/page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    defaultTransition: Transition.cupertino,
    debugShowCheckedModeBanner: false,
    title: 'Kos App',
    theme: ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: palettes['primary'],
      accentColor: palettes['accent'],
    ),
    onInit: () => debugPrint('init get app'),
    home: HomePage(),
  );
}