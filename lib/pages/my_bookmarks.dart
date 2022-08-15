import 'package:flutter/material.dart';

class MyBookmarks extends StatelessWidget {
  const MyBookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookmarks"),
      ),
    );
  }
}
