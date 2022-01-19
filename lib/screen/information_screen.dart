///
/// screen/information_screen.dart
///
import 'package:flutter/material.dart';
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
              color: Colors.indigo,
              margin: const EdgeInsets.all(12),
              elevation: 0.0,
              child: SizedBox(
                width: 150,
                height: 50.0,
                child: InkWell(
                  splashColor: Colors.amber,
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
            const Text(
              "Rigoureux, curieux et motivé,\n"
              "je suis passionné par le développement mobile et je souhaite y évoluer. "
              "Je finalise actuellement mon Master dans ce domaine pour enfin créer mon application. (une, utile à la société)",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            )
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
