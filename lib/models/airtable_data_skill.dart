import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_gregs_cv/utils/config.dart';

///
/// models/airtable_data_experience.dart
///

class Skill {
  String id;
  String createdTime;
  String title;
  String attachmentUrl;
  String category;

  Skill(
      {required this.id,
      required this.createdTime,
      required this.title,
      required this.attachmentUrl,
      required this.category});
}

class AirtableDataSkill {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/skill",
    {"maxRecords": "20", "view": "Grid view"},
  );

  Future<List<Skill>> getSkills() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<Skill> values = [];
      data.forEach(
        (value) => {
          values.add(
            Skill(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              attachmentUrl: value['fields']['attachment_url'],
              category: value['fields']['category'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
