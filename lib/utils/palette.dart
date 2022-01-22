//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor blueNavy = MaterialColor(
      0xff08216a,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff08216a), //10%
      100: Color(0xff08216a), //20%
      200: Color(0xff08216a), //30%
      300: Color(0xff08216a), //40%
      400: Color(0xff08216a), //50%
      500: Color(0xff08216a), //60%
      600: Color(0xff08216a), //70%
      700: Color(0xff08216a), //80%
      800: Color(0xff08216a), //90%
      900: Color(0xff00205b), //100%
    },
  );

  static const MaterialColor yellowRicard = MaterialColor(
    0xffffcd00,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffffcd00), //10%
      100: Color(0xffffcd00), //20%
      200: Color(0xffffcd00), //30%
      300: Color(0xffffcd00), //40%
      400: Color(0xffffcd00), //50%
      500: Color(0xffffcd00), //60%
      600: Color(0xffffcd00), //70%
      700: Color(0xffffcd00), //80%
      800: Color(0xffffcd00), //90%
      900: Color(0xffffcd00), //100%
    },
  );
}
