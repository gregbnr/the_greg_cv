///
/// models/airtable_data_profile.dart
///
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_gregs_cv/utils/config.dart';

class AirtableDataProfile {
  String id;
  String createdTime;
  String content;
  String icon;

  AirtableDataProfile(
      {required this.id,
      required this.createdTime,
      required this.content,
      required this.icon});
}

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/profile",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataProfile>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      List<AirtableDataProfile> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataProfile(
              id: value['id'],
              createdTime: value['createdTime'],
              content: value['fields']['content'],
              icon: value['fields']['icon'],
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
