import 'package:flutter/material.dart';
import 'choose_snip_length.dart';

class ChooseSnipLength extends StatefulWidget {
  const ChooseSnipLength({Key? key}) : super(key: key);

  @override
  _ChooseSnipLengthState createState() => _ChooseSnipLengthState();
}

class _ChooseSnipLengthState extends State<ChooseSnipLength> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Snippet Length"),
      ),
      body: const Center(),
    );
  }
}
