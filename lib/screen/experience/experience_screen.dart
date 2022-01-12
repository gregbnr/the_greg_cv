///
/// screen/experience_screen.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_experience.dart';
import 'package:the_gregs_cv/screen/experience/experience_detail_screen.dart';
import 'package:the_gregs_cv/widget/widget_image.dart';
import 'package:the_gregs_cv/widget/widget_progressbar.dart';
import 'package:the_gregs_cv/widget/widget_text.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AirtableDataExperience airtableData = AirtableDataExperience();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Experiences"),
      ),
      body: FutureBuilder(
        future: airtableData.getExperiences(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Experience>> snapshot) {
          if (snapshot.hasData) {
            List<Experience>? experiences = snapshot.data;
            return ListView.builder(
                itemCount: experiences!.length,
                itemBuilder: (context, index) {
                  Experience xp = experiences[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: startImageRoundedWidget(xp.attachmentUrl),
                        title: titleTextWidget(xp.title),
                        contentPadding:
                            const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                        subtitle: subtitleTextWidget(xp.function),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ExperienceDetailScreen(experience: xp),
                        )),
                      ),
                      const Divider()
                    ],
                  );
                });
          } else {
            return topProgressBar();
          }
        },
      ),
    );
  }
}
