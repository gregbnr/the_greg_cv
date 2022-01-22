///
/// screen/skill_screen.dart
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_skill.dart';
import 'package:the_gregs_cv/widget/widget_progressbar.dart';
import 'package:the_gregs_cv/widget/widget_text.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({Key? key}) : super(key: key);

  @override
  SkillScreenState createState() => SkillScreenState();
}

class SkillScreenState extends State<SkillScreen> {
  final AirtableDataSkill airtableData = AirtableDataSkill();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compétences"),
      ),
      body: FutureBuilder(
          future: airtableData.getSkills(),
          builder: (BuildContext context, AsyncSnapshot<List<Skill>> snapshot) {
            if (snapshot.hasData) {
              List<Skill> skills = snapshot.data!;
              var mobile = skills
                  .where((element) => element.category == "Mobile")
                  .toList();
              var web =
                  skills.where((element) => element.category == "Web").toList();
              var data = skills
                  .where((element) => element.category == "Data")
                  .toList();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _getContainerByCategories("Mobile", mobile),
                      _getContainerByCategories("Web", web),
                      _getContainerByCategories("Data", data)
                    ],
                  ),
                ),
              );
            } else {
              return topProgressBar();
            }
          }),
    );
  }

  Widget _getContainerByCategories(String title, List<Skill> skills) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleTextWidget(title),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisCount: 4,
                  children: List.generate(skills.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: getTextWidgets(skills[index]),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Divider(),
        )
      ],
    );
  }

  Widget getTextWidgets(Skill skill) {
    return Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            imageWithCornerRounded(skill.attachmentUrl),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                skill.title,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget imageWithCornerRounded(String url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          width: 40,
          height: 40,
        ));
  }
}
