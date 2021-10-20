import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

enum Option { byChapter, byPages, byTime }

class SnippetForm extends StatefulWidget {
  const SnippetForm({Key? key}) : super(key: key);

  @override
  _SnippetFormState createState() => _SnippetFormState();
}

class _SnippetFormState extends State<SnippetForm> {
  Option? _choice;
  int pageNum = 0;
  int chapterNum = 0;
  int timeNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "How do you want each book to be partitioned?",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        RadioListTile<Option>(
          title: const Text('By Chapter'),
          value: Option.byChapter,
          groupValue: _choice,
          onChanged: (Option? value) {
            setState(() {
              _choice = value;
            });
          },
        ),
        RadioListTile<Option>(
          title: const Text('By number of pages'),
          value: Option.byPages,
          groupValue: _choice,
          onChanged: (Option? value) {
            setState(() {
              _choice = value;
            });
          },
        ),
        RadioListTile<Option>(
          title: const Text('By amount of time per day'),
          value: Option.byTime,
          groupValue: _choice,
          onChanged: (Option? value) {
            setState(() {
              _choice = value;
            });
          },
        ),
        CustomNumberPicker(
            initialValue: 1,
            maxValue: 100,
            minValue: 0,
            step: 1,
            onValue: (value) {
              if (_choice == Option.byChapter) {
                chapterNum = int.parse(value.toString());
              }

              if (_choice == Option.byPages) {
                pageNum = int.parse(value.toString());
              }

              if (_choice == Option.byTime) {
                timeNum = int.parse(value.toString());
              }
            }),
        ElevatedButton(
          onPressed: () {
            //TODO: Move to partition screen
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
