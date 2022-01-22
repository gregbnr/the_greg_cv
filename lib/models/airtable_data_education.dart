import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_gregs_cv/utils/config.dart';

///
/// models/airtable_data_experience.dart
///

class Education {
  String id;
  String createdTime;
  String schoolName;
  String degree;
  String date;
  String note;
  String attachmentUrl;

  Education(
      {required this.id,
      required this.createdTime,
      required this.schoolName,
      required this.degree,
      required this.date,
      required this.note,
      required this.attachmentUrl});
}

class AirtableDataEducation {
  final Uri urlExperience = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<Education>> getEducations() async {
    final res = await http.get(
      urlExperience,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<Education> values = [];
      data.forEach(
        (value) => {
          values.add(
            Education(
              id: value['id'],
              createdTime: value['createdTime'],
              schoolName: value['fields']['school_name'],
              degree: value['fields']['degree'],
              date: value['fields']['date'],
              note: value['fields']['note'],
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
