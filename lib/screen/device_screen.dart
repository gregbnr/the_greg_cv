///
/// screen/device.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/screen/education_screen.dart';
import 'package:the_gregs_cv/screen/experience_screen.dart';
import 'package:the_gregs_cv/screen/information_screen.dart';
import 'package:the_gregs_cv/screen/profile_screen.dart';
import 'package:the_gregs_cv/screen/skill_screen.dart';

/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;

  /// liste des écrans
  final List<Widget> _screenList = [
    const ProfileScreen(),
    const ExperienceScreen(),
    const EducationScreen(),
    const SkillScreen(),
    const InformationScreen(),
  ];

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        //
        onTap: onTabTapped,
        //
        currentIndex: _currentScreen,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 0,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person_outlined, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outlined),
            activeIcon: Icon(Icons.work_outlined, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school_outlined, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            activeIcon: Icon(Icons.task_alt_outlined, size: 35),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outlined),
            activeIcon: Icon(Icons.info_outlined, size: 35),
            label: '',
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
