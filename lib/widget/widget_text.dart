import 'package:flutter/material.dart';

Widget titleTextWidget(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );
}

Widget subtitleTextWidget(String subtitle) {
  return Text(
    subtitle,
    style: const TextStyle(fontSize: 15),
  );
}

Widget dateTextWidget(String date) {
  return Text(
    date,
    style: const TextStyle(color: Colors.grey),
  );
}
