import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_gregs_cv/utils/config.dart';

///
/// models/airtable_data_experience.dart
///

class Experience {
  String id;
  String createdTime;
  String title;
  String function;
  String status;
  String date;
  String note;
  String? skills;
  String attachmentUrl;

  Experience(
      {required this.id,
      required this.createdTime,
      required this.title,
      required this.function,
      required this.status,
      required this.date,
      required this.note,
      required this.skills,
      required this.attachmentUrl});
}

class AirtableDataExperience {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/experience",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<Experience>> getExperiences() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<Experience> values = [];
      data.forEach(
        (value) => {
          values.add(
            Experience(
              id: value['id'],
              createdTime: value['createdTime'],
              title: value['fields']['title'],
              function: value['fields']['function'],
              status: value['fields']['status'],
              date: value['fields']['date'],
              note: value['fields']['note'],
              skills: value['fields']['skills'],
              attachmentUrl: value['fields']['attachment_url'],
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
