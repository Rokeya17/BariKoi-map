import 'dart:async';

import 'package:barikoi_map/utils/approutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/barikoi_logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const SpinKitThreeBounce(
              color: Color.fromARGB(255, 94, 152, 96),
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
