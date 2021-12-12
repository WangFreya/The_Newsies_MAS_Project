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

  ReadingMat _savedReading = ReadingMat(title: '', textFile: '');
  final _biggerFont = const TextStyle(fontSize: 18.0);

  final List<ReadingMat> _readings = [
    ReadingMat(title: 'Example 1', textFile: 'File 1'),
    ReadingMat(title: 'Example 2', textFile: 'File 1'),
    ReadingMat(title: 'Example 3', textFile: 'File 1'),
    ReadingMat(title: 'Example 4', textFile: 'File 1')
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
