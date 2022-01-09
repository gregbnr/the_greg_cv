///
/// screen/experience_screen.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_experience.dart';
import 'package:the_gregs_cv/screen/experience/experience_detail.dart';

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
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            xp.attachmentUrl,
                          ),
                        ),
                        title: Text(xp.title),
                        contentPadding:
                            const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                        subtitle: Text("${xp.date}\n${xp.function}"),
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
