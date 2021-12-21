///
/// screen/skill_screen.dart
///
import 'package:flutter/material.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compétences"),
      ),
    );
  }
}
