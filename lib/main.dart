import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/api_providers/user_data_provider.dart';
import 'package:vendor_delivery/api_providers/verify_otp_provider.dart';
import 'package:vendor_delivery/screens/login1.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserDataProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => VerifyOtpProvider(),
      )
    ],
    child: const MyApp(),
  ));
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
        home: LoginPage1()
        // home: TrackLocation(),
        // home: AdminVerify()
        );
  }
}
