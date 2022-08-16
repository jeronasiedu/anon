import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final createPostController = TextEditingController();
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
                    print(createPostController.text);
                    createPostController.clear();
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
                label: const Text("Send"),
                icon: const Icon(Ionicons.mail_outline),
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
