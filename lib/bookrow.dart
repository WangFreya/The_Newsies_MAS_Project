import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/file_playlist.dart';
import 'package:newsies_sprint3_prototype/reading_mat.dart';
import 'choose_snip_length.dart';

class BookRow extends StatefulWidget {
  const BookRow({Key? key}) : super(key: key);

  @override
  _BookRowState createState() => _BookRowState();
}

class _BookRowState extends State<BookRow> {
  //final _books = <String>['The Great Gatsby', 'Jane Eyre', 'The Fifth Season'];

  ReadingMat _savedReading =
      ReadingMat(title: '', textFile: '', snippetLength: 0);
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final List<ReadingMat> _readings = [
    ReadingMat(
        title: 'The Great Gatsby',
        textFile: 'TheGreatGatsby',
        snippetLength: 5),
    ReadingMat(
        title: 'The Selection of a Reseach Design',
        textFile: 'File 1',
        snippetLength: 5),
    ReadingMat(
        title: 'Blockchain and the Future of the Internet',
        textFile: 'File 1',
        snippetLength: 5),
    ReadingMat(
        title: 'Contextual Interviews', textFile: 'File 1', snippetLength: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return _buildBookRows();
  }

  Widget _buildBookRows() {
    return ListView.builder(
      itemCount: _readings.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(int index) {
    return ListTile(
      title: Text(
        _readings.elementAt(index).getTitle(),
        style: _biggerFont,
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          _savedReading = _readings.elementAt(index);
          //navigate to new route
          //_reading = ReadingMat(title: _savedBook, textFile: '');

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FilePlaylist(reading: _savedReading)),
          );
        });
      },
    );
  }
}
