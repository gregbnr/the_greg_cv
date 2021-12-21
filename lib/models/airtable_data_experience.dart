///
/// models/airtable_data_experience.dart
///

class AirtableDataExperience {
  String id;
  String title;
  String function;
  String date;
  String note;
  String attachment;

  AirtableDataExperience(
      {required this.id,
      required this.title,
      required this.function,
      required this.date,
      required this.note,
      required this.attachment});
}
