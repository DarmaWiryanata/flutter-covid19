import 'package:flutter/material.dart';
import 'package:survei/pages/base.dart';
import 'package:survei/pages/form.dart';
import 'package:survei/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survei by Kataback',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/BaseScreen": (BuildContext context) => BaseScreen(),
        "/FormScreen": (BuildContext context) => FormScreen()
      },
    );
  }
}
