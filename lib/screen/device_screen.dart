///
/// screen/device.dart
///
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/screen/education_screen.dart';
import 'package:the_gregs_cv/screen/experience/experience_screen.dart';
import 'package:the_gregs_cv/screen/information_screen.dart';
import 'package:the_gregs_cv/screen/profile_screen.dart';
import 'package:the_gregs_cv/screen/skill_screen.dart';
import 'package:the_gregs_cv/utils/palette.dart';

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

  final _kPages = <String, Icon>{
    'Profil': getIconWithColor(Icons.person_outlined, false),
    'Exp': getIconWithColor(Icons.work_outlined, false),
    'Formation': getIconWithColor(Icons.school_outlined, false),
    'Skill': getIconWithColor(Icons.task_alt_outlined, false),
    'Info+': getIconWithColor(Icons.info_outlined, false),
  };

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: _screenList[_currentScreen],
      bottomNavigationBar: ConvexAppBar(
        activeColor: Colors.amber,
        backgroundColor: Palette.blueNavy,
        style: TabStyle.textIn,
        items: <TabItem>[
          for (final screen in _kPages.entries)
            TabItem(
                icon: screen.value,
                title: screen.key,
                activeIcon: getIconWithColor(screen.value.icon!, true)),
        ],
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}

Icon getIconWithColor(IconData iconLabel, bool isActiveIcon) {
  Color _color = Colors.white;

  if (isActiveIcon) {
    _color = Colors.amber;
    return Icon(iconLabel, color: _color, size: 25);
  } else {
    return Icon(iconLabel, color: _color, size: 25);
  }
}
