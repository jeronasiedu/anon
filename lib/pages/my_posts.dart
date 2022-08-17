import 'package:flutter/material.dart';
import 'package:kcapp/utils/post_examples.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My posts"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        itemCount: posts.length - 3,
        itemBuilder: (context, index) {
          return const Text("testing");
        },
      ),
    );
  }
}
