import 'package:flutter/material.dart';

enum Option { byChapter, byPages, byTime }

class SnippetForm extends StatefulWidget {
  const SnippetForm({Key? key}) : super(key: key);

  @override
  _SnippetFormState createState() => _SnippetFormState();
}

class _SnippetFormState extends State<SnippetForm> {
  Option? _choice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "How long do I want each book partition to be?",
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
      ],
    );
  }

  // class _SnippetFormState extends State<SnippetForm> {
  // Option? _choice;
  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: <Widget>[
  //       RadioListTile<Option>(
  //         title: const Text('By Chapter'),
  //         value: Option.byChapter,
  //         groupValue: _choice,
  //         onChanged: (Option? value) {
  //           setState(() {
  //             _choice = value;
  //           });
  //         },
  //       ),
  //       RadioListTile<Option>(
  //         title: const Text('By number of pages'),
  //         value: Option.byPages,
  //         groupValue: _choice,
  //         onChanged: (Option? value) {
  //           setState(() {
  //             _choice = value;
  //           });
  //         },
  //       ),
  //       RadioListTile<Option>(
  //         title: const Text('By amount of time per day'),
  //         value: Option.byTime,
  //         groupValue: _choice,
  //         onChanged: (Option? value) {
  //           setState(() {
  //             _choice = value;
  //           });
  //         },
  //       ),
  //     ],
  //   );
  // }
}
