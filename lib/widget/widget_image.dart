import 'package:flutter/material.dart';

Widget imageWithCornerRoundedWidget(String url) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), child: Image.network(url));
}
