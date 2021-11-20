import 'package:flutter/material.dart';

class TrackList extends StatelessWidget {
  const TrackList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const <Widget>[
          Card(
            child:
                ListTile(title: Text("Audio File 1"), trailing: Text("5:06")),
          ),
          Card(
            child: ListTile(
              title: Text("Audio File 2"),
              trailing: Text("4:57"),
            ),
          ),
          Card(
            child:
                ListTile(title: Text("Audio File 3"), trailing: Text("5:12")),
          )
        ],
      ),
    );
  }
}
