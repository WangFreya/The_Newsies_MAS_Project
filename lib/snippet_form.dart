import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';
import 'package:newsies_sprint3_prototype/file_playlist.dart';
import 'package:newsies_sprint3_prototype/reading_mat.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:http/http.dart' as http;

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
  var reading = ReadingMat(
      title: 'The Great Gatsby', textFile: 'TheGreatGatsby', snippetLength: 5);

  uploadFile() async {
    var headers = {'Content-Type': 'application/txt'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://qkn7hy7gx2.execute-api.us-east-1.amazonaws.com/dev/mas-newsies-splitter-bucket/' +
                timeNum.toString() +
                'gatsby.txt'));
    request.body =
        r'In my younger and more vulnerable years my father gave me some advice that I’ve been turning over in my mind ever since.';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

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
            uploadFile();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FilePlaylist(
                        reading: reading,
                      )),
            );
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
