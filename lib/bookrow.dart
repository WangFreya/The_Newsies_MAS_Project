import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/file_playlist.dart';
import 'choose_snip_length.dart';

class BookRow extends StatefulWidget {
  const BookRow({Key? key}) : super(key: key);

  @override
  _BookRowState createState() => _BookRowState();
}

class _BookRowState extends State<BookRow> {
  final _books = <String>['The Great Gatsby', 'Jane Eyre', 'The Fifth Season'];

  String _savedBook = '';
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildBookRows();
  }

  Widget _buildBookRows() {
    return ListView.builder(
      itemCount: _books.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(int index) {
    return ListTile(
      title: Text(
        _books.elementAt(index),
        style: _biggerFont,
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          if (_savedBook == '') {
            _savedBook = _books.elementAt(index);
          }
          //navigate to new route
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilePlaylist()),
          );
        });
      },
    );
  }
}
