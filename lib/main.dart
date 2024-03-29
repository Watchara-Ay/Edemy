import 'package:edgroup/screen/authentication/auth_redirect.dart';
import 'package:edgroup/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromARGB(255, 118, 215, 196)),
      home: const AuthRedirectScreen(),
    );
  }
}
