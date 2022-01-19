///
/// screen/profile_screen.dart
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_gregs_cv/models/airtable_data_profile.dart';
import 'package:the_gregs_cv/utils/palette.dart';
import 'package:the_gregs_cv/widget/widget_progressbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableDataProfile airtableData = AirtableDataProfile();

    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 12, bottom: 15),
              title: const Text("Grégoire Bonnier"),
              background: Container(
                padding: const EdgeInsets.all(10),
                color: Palette.blueNavy,
                alignment: Alignment.center,
                child: GestureDetector(
                    child: const Hero(
                      tag: 'imageHero',
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/greg.png"),
                        maxRadius: 80,
                      ),
                    ),
                    onTap: () {
                      _showProfileImage(context);
                    }),
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
            child: FutureBuilder(
              future: airtableData.getProfile(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Profile>> snapshot) {
                if (snapshot.hasData) {
                  List<Profile>? values = snapshot.data;
                  return ListView(
                    physics: const ScrollPhysics(),
                    children: values!
                        .map(
                          (Profile value) => ListTile(
                            leading: Text(
                              value.icon,
                              style: const TextStyle(
                                  fontFamily: 'MaterialIcons', fontSize: 20),
                            ),
                            title: Text(value.content),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return circleProgressBar();
                }
              },
            ),
          ),
        ],
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

void _showProfileImage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Container(
          color: Palette.blueNavy,
          child: Center(
            child: GestureDetector(
                child: const Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/my_profile.png"),
                    maxRadius: 180,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
      ),
    ),
  );
}
