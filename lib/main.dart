import 'package:flutter/material.dart';
import 'package:flutter_loan_app/constant.dart';
import 'package:flutter_loan_app/screen/signin_screen.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan app',
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}

class H extends StatelessWidget {
  const H({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              height: 200,
              child: Container(height: 200, width: 200, color: Colors.red)),
          Positioned(
              right: 50,
              left: 50,
              height: 100,
              top: 150,
              child: Container(height: 200, width: 200, color: Colors.green))
        ],
      ),
    );
  }
}
