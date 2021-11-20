import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:newsies_sprint3_prototype/file_playlist.dart';
import 'package:numberpicker/numberpicker.dart';

import 'partitioned_text.dart';

enum Option { byChapter, byPages, byTime }

class SnippetForm extends StatefulWidget {
  const SnippetForm({Key? key}) : super(key: key);

  @override
  _SnippetFormState createState() => _SnippetFormState();
}

class _SnippetFormState extends State<SnippetForm> {
  int pageNum = 0;
  int chapterNum = 0;
  int timeNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "How long do you want your snippets to be?",
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
        NumberPicker(
          value: timeNum,
          maxValue: 30,
          minValue: 0,
          step: 5,
          onChanged: (value) => setState(() => timeNum = value),
        ),
        const Text("minutes"),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FilePlaylist()),
            );
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
