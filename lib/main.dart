import 'package:flutter/material.dart';
import 'package:vendor_delivery/screens/adminVerify.dart';
import 'package:vendor_delivery/screens/home.dart';
import 'package:vendor_delivery/screens/login1.dart';
import 'package:vendor_delivery/screens/traclkLocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: LoginPage1(),
        // home: TrackLocation(),
        home: AdminVerify());
  }
}
