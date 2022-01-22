///
/// screen/information_screen.dart
///
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_gregs_cv/utils/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  MaterialColor _colorIcon = Palette.blueNavy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informations"),
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: const [
                  Text(
                    "Bienvenue sur ma premère appli mobile, entièrement créée en Dart/Flutter.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Palette.blueNavy),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      "Dans cette application vous trouverez mon CV et aussi mes skills en Flutter\n"
                      "N'hésitez pas à m'envoyer un mail pour prendre contact avec moi\n"
                      "ou retrouvez-moi sur LinkedIn !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Palette.blueNavy,
                  margin: const EdgeInsets.all(12),
                  elevation: 5,
                  child: SizedBox(
                    width: 100,
                    height: 35,
                    child: InkWell(
                        splashColor: Palette.yellowRicard,
                        onTap: () async {
                          _launchURL();
                        },
                        child: const Center(
                          child: Text(
                            'Par mail',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ),
                const Text(
                  'ou',
                ),
                iconLink(FontAwesomeIcons.linkedin,
                    'https://www.linkedin.com/in/gregoire-bonnier/')
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    const _url = 'mailto:gmfbonnier@gmail.com';
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  Widget iconLink(var icon, String _url) {
    return GestureDetector(
      onTap: () {
        launch(_url, forceSafariVC: false);
      },
      onTapCancel: () {
        setState(() {
          _colorIcon = Palette.blueNavy;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: FaIcon(
          icon,
          color: _colorIcon,
          size: 35,
        ),
      ),
    );
  }
}
