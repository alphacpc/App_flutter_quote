import 'package:flutter/material.dart';
import 'package:andoo/Screens/Detail.dart';
import 'package:andoo/Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'andoo app',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Home Page'),
        '/Detail': (context) => Detail()
      },
      // home: HomePage(
      //   title: "Home page",
      // ),
    );
  }
}
