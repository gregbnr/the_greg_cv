///
/// screen/room.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_experience.dart';
import 'package:the_gregs_cv/utils/palette.dart';
import 'package:the_gregs_cv/widget/widget_text.dart';

class ExperienceDetailScreen extends StatelessWidget {
  final Experience experience;

  const ExperienceDetailScreen({Key? key, required this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(experience.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Palette.yellowRicard,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      experience.attachmentUrl,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dateTextWidget(experience.date),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                      child: Text(experience.status,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Visibility(
                      visible: experience.skills != null,
                      child: Text(
                          experience.skills != null ? experience.skills! : ""),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Text(experience.note),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
