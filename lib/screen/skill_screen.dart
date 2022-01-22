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
              return Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
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
      children: <Widget>[
        titleTextWidget(title),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: getTextWidgets(skills),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Divider(),
        )
      ],
    );
  }

  Widget getTextWidgets(List<Skill> skills) {
    List<Widget> list = <Widget>[];
    for (var skill in skills) {
      list.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: Column(
            children: [
              imageWithCornerRounded(skill.attachmentUrl),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  skill.title,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Row(children: list);
  }

  Widget imageWithCornerRounded(String url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          url,
          width: 30,
          height: 30,
        ));
  }
}
