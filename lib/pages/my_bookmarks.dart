import 'package:dilo/utils/post_examples.dart';
import 'package:flutter/material.dart';

class MyBookmarks extends StatelessWidget {
  const MyBookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookmarks"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemCount: posts.length - 4,
        itemBuilder: (context, index) {
          return const Text("testing");
        },
      ),
    );
  }
}
