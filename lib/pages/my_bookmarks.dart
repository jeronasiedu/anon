import 'package:flutter/material.dart';
import 'package:kcapp/utils/post_examples.dart';
import 'package:kcapp/widgets/my_bookmark_widget.dart';

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
          return MyBookmarkWidget(
            comments: posts[index]['comments'],
            likes: posts[index]['likes'],
            text: posts[index]['text'],
            time: posts[index]['time'],
          );
        },
      ),
    );
  }
}
