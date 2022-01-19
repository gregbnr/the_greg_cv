///
/// screen/profile_screen.dart
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_profile.dart';
import 'package:the_gregs_cv/utils/palette.dart';
import 'package:the_gregs_cv/widget/widget_progressbar.dart';

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
            elevation: 10,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 12, bottom: 15),
              title: const Text("Grégoire Bonnier "),
              background: Container(
                padding: const EdgeInsets.all(10),
                color: Palette.blueNavy,
                alignment: Alignment.center,
                child: GestureDetector(
                    child: Hero(tag: 'imageHero', child: _loadToonImage()),
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
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: values!
                          .map(
                            (Profile value) => ListTile(
                              leading: Text(
                                value.icon,
                                style: const TextStyle(
                                    fontFamily: 'MaterialIcons', fontSize: 20),
                              ),
                              title: Center(child: Text(value.content)),
                            ),
                          )
                          .toList(),
                    ),
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


void _showProfileImage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: GestureDetector(
            child: Container(
              color: Palette.blueNavy,
              child: const Center(
                child: Hero(
                  tag: 'imageHero',
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/my_profile.png"),
                    maxRadius: 180,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            }),
      ),
    ),
  );
}

CircleAvatar _loadToonImage() {
  return const CircleAvatar(
    maxRadius: 85.0,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      backgroundImage: AssetImage("assets/greg.png"),
      maxRadius: 80,
    ),
  );
}