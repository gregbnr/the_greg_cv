import 'package:flutter/material.dart';

Widget topProgressBar() {
  return const LinearProgressIndicator(color: Colors.amber, minHeight: 5);
}

Widget circleProgressBar() {
  return const Center(child: CircularProgressIndicator(color: Colors.amber));
}
