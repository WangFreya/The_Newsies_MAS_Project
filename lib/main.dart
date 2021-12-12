// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:newsies_sprint3_prototype/choose_snip_length.dart';
import 'bookrow.dart';
import 'choose_snip_length.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Newsies Sprint 3', home: MyHome());
  }
}
// Scaffold(
//   appBar: AppBar(
//     title: const Text('Snippet Learning Prototype'),
//   ),
//   body: Center(
//       child: Column(children: <Widget>[
//     const Expanded(child: BookRow()),
// TextButton(
//     onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => const ChooseSnipLength()),
//       );
//     },
//     child: const Text('Upload File'))
//   Builder(
// builder: (context) => Center(
//       child: TextButton(
//         child: Text("UploadFile"),
//         onPressed: () => Navigator.pushNamed(context, ChooseSnipLength()),
//       ),
//     ),
// ])),
//     ;),
//   );
// }
// }

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snippet Learning Prototype'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          const Expanded(child: BookRow()),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseSnipLength()),
                );
              },
              child: const Text('Upload File'))
        ])));
  }
}
