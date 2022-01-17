///
/// screen/education_screen.dart
///
import 'package:flutter/material.dart';
import 'package:the_gregs_cv/models/airtable_data_education.dart';
import 'package:the_gregs_cv/widget/widget_image.dart';
import 'package:the_gregs_cv/widget/widget_progressbar.dart';
import 'package:the_gregs_cv/widget/widget_text.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  EducationScreenState createState() => EducationScreenState();
}

class NewItem {
  bool isExpanded;
  final Widget title;
  final Widget subtitle;
  final Widget body;
  final Widget image;

  NewItem(this.isExpanded, this.title, this.subtitle, this.body, this.image);
}

class EducationScreenState extends State<EducationScreen> {
  final AirtableDataEducation airtableData = AirtableDataEducation();

  List<NewItem> _getItems(List<Education>? educations) {
    List<NewItem>? items = [];
    if (educations != null) {
      for (var _education in educations) {
        var _item = NewItem(
            false, // isExpanded
            titleTextWidget(_education.schoolName), // title
            subtitleTextWidget(_education.degree), // subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                    child: dateTextWidget(_education.date)),
                Text(
                  _education.note,
                ),
              ],
            ), // body
            imageWithCornerRoundedWidget(_education.attachmentUrl));
        items.add(_item);
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formations"),
      ),
      body: FutureBuilder(
          future: airtableData.getEducations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Education>> snapshot) {
            if (snapshot.hasData) {
              List<NewItem> items = _getItems(snapshot.data);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(items[index]);
                },
              );
            } else {
              return topProgressBar();
            }
          }),
    );
  }

  Widget _buildItem(NewItem item) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
              childrenPadding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 12.0),
              leading: item.image,
              title: item.title,
              subtitle: item.subtitle,
              children: <Widget>[
                item.body,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
