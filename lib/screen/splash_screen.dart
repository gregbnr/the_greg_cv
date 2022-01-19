///
/// screen/information_screen.dart
///
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/screen/device_screen.dart';
import 'package:the_gregs_cv/utils/palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const DeviceScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Palette.blueNavy,
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 100,
            ),
            TextLiquidFill(
              loadDuration: const Duration(seconds: 6),
              waveDuration: const Duration(seconds: 1),
              textAlign: TextAlign.center,
              text: "Greg's CV",
              waveColor: Palette.yellowRicard,
              boxBackgroundColor: Palette.blueNavy,
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 50.0,
              ),
              boxHeight: 100,
            ),
          ]),
    ));
  }
}
