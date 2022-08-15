// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/utils/comments_examples.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({
    Key? key,
    required this.text,
    required this.time,
    required this.likes,
    required this.comments,
    required this.color,
  }) : super(key: key);
  final String text;
  final String time;
  final String likes;
  final String comments;
  final Color color;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final _commentController = TextEditingController();
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final String time = widget.time;
    final String likes = widget.likes;
    final String comments = widget.comments;
    final Color color = widget.color;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Picture of the day"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: const Icon(
              Ionicons.bookmark_outline,
            ),
          ),
        ],
      ),
      body: ColoredBox(
        color: color,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Ionicons.diamond_outline,
                        size: 15,
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    maxLines: 6,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.chatbox_ellipses_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        comments,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.heart_outline,
                      ),
                    ),
                    Text(
                      likes,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.8,
            ),
            Column(
              children: List.generate(commentsExamples.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Ionicons.glasses_outline,
                              color: Colors.white60,
                            ),
                          ),
                          Text(
                            commentsExamples[index]['time'],
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          commentsExamples[index]['text'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          maxLines: 6,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomSheet: CommentForm(commentController: _commentController),
    );
  }
}

class CommentForm extends StatelessWidget {
  const CommentForm({
    Key? key,
    required TextEditingController commentController,
  })  : _commentController = commentController,
        super(key: key);

  final TextEditingController _commentController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _commentController,
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.multiline,
        maxLines: 8,
        minLines: 1,
        style: const TextStyle(
          fontSize: 17,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Why do you want to post an empty comment?';
          }
          return null;
        },
        onFieldSubmitted: ((value) {
          if (_commentController.text.isNotEmpty) {
            _commentController.clear();
          }
        }),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              if (_commentController.text.isNotEmpty) {
                _commentController.clear();
              } else {
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content:
                          Text('Why do you want to post an empty comment?'),
                    ),
                  );
              }
            },
            icon: const Icon(Ionicons.rocket),
          ),
          contentPadding: const EdgeInsets.all(12),
          hintText: "Don't be shy, share your comment!",
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
