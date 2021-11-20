import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            const Text(
              "File you want to listen to",
              style: TextStyle(height: 5, fontSize: 24),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const SizedBox(width: 20),
                TextButton(
                    onPressed: () {},
                    child: const Text('PLAY'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                SizedBox(width: 200.0),
                const Text("3 files | 15 min")
              ],
            )
          ],
        ))
      ],
    );
  }
}
