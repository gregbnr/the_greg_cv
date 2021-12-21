///
/// screen/profile_screen.dart
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_gregs_cv/models/airtable_data_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableData airtableData = AirtableData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      //
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Grégoire Bonnier",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/fieldpro.jpeg"),
                      maxRadius: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        iconLink(FontAwesomeIcons.linkedin,
                            'https://www.linkedin.com/in/gregoire-bonnier/')
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: FutureBuilder(
                        future: airtableData.getProfil(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<AirtableDataProfile>> snapshot) {
                          if (snapshot.hasData) {
                            List<AirtableDataProfile>? values = snapshot.data;
                            return ListView(
                              children: values!
                                  .map(
                                    (AirtableDataProfile value) => ListTile(
                                      leading: Text(
                                        value.icon,
                                        style: const TextStyle(
                                            fontFamily: 'MaterialIcons'),
                                      ),
                                      title: Text(value.content),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// IMAGE CIRCLE
          ],
        ),
      ),
    );
  }
}

Widget iconLink(var icon, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      child: FaIcon(
        icon,
        color: Colors.black,
        size: 32,
      ),
    ),
  );
}
