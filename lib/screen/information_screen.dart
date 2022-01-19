///
/// screen/information_screen.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/utils/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                "Bienvenue sur ma premère appli mobile, entièrement créée en Flutter.\n"
                "Dans cette application vous trouverez mon CV et aussi mes skills en Flutter\n"
                "N'hésitez pas à m'envoyer un mail pour prendre contact avec moi !",
                textAlign: TextAlign.center,
              ),
            ),
            Card(
              color: Palette.blueNavy,
              margin: const EdgeInsets.all(12),
              elevation: 5,
              child: SizedBox(
                width: 150,
                height: 50.0,
                child: InkWell(
                  splashColor: Palette.yellowRicard,
                  onTap: () async {
                    _launchURL();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Contactez-moi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
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
}
