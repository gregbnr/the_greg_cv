import 'package:the_gregs_cv/utils/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

///
/// models/airtable_data_experience.dart
///

class Experience {
  String id;
  String createdTime;
  String title;
  String function;
  String date;
  String note;
  String attachmentUrl;

  Experience(
      {required this.id,
      required this.createdTime,
      required this.title,
      required this.function,
      required this.date,
      required this.note,
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

    developer.log("STATUS CODE");
    developer.log(res.statusCode.toString());

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
              date: value['fields']['date'],
              note: value['fields']['note'],
              attachmentUrl: value['fields']['attachmentUrl'],
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
