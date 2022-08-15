import 'package:flutter/material.dart';
import 'package:kcapp/pages/create_post.dart';
import 'package:kcapp/utils/post_examples.dart';
import 'package:kcapp/widgets/post.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'A N O N',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Post(
              comments: posts[index]['comments'],
              likes: posts[index]['likes'],
              text: posts[index]['text'],
              time: posts[index]['time'],
              color: posts[index]['color'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePost(),
            ),
          );
        },
        backgroundColor: Colors.white,
        child: Lottie.asset(
          'assets/chat_lottie.json',
          width: 45,
        ),
      ),
    );
  }
}
