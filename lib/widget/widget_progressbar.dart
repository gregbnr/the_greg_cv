import 'package:flutter/material.dart';
import 'package:the_gregs_cv/utils/palette.dart';

Widget topProgressBar() {
  return const LinearProgressIndicator(
      color: Palette.yellowRicard, minHeight: 5);
}

Widget circleProgressBar() {
  return const Center(
      child: CircularProgressIndicator(color: Palette.yellowRicard));
}
