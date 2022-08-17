import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/database/models/post_model.dart';
import 'package:lottie/lottie.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final createPostController = TextEditingController();
  bool _isLoading = false;
  Future createPost(PostModel post, context) async {
    setState(() {
      _isLoading = true;
    });
    final postsRef = FirebaseFirestore.instance.collection('posts');
    final postData = post.toMap();
    await postsRef.add(postData).whenComplete(() {
      createPostController.clear();
      Navigator.pop(context);
      setState(() {
        _isLoading = false;
      });
      return;
    });
  }

  @override
  void dispose() {
    createPostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  autofocus: true,
                  controller: createPostController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  maxLength: 80,
                  decoration: const InputDecoration.collapsed(
                    hintText:
                        "Share your thoughts and experience with the people around you",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (createPostController.text.isNotEmpty) {
                    final post = PostModel(text: createPostController.text);
                    createPost(post, context);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content:
                              Text("Why do you want to create an empty post?"),
                        ),
                      );
                  }
                },
                label: Text(_isLoading ? 'Creating...' : 'Send'),
                icon: _isLoading
                    ? Lottie.asset(
                        'assets/loading.json',
                        width: 28,
                      )
                    : const Icon(Ionicons.mail_outline),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(
                    12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
