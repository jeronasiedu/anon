// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostDetails extends StatefulWidget {
  const PostDetails({
    Key? key,
    required this.text,
    required this.time,
    required this.likes,
    required this.comments,
    required this.id,
  }) : super(key: key);
  final String text;
  final DateTime time;
  final String likes;
  final List comments;
  final String id;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final _commentController = TextEditingController();
  Future<void> postComment(String text) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comment posted'),
      ),
    );
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.id)
          .update({
        'comments': FieldValue.arrayUnion([
          {
            'text': text,
            'time': Timestamp.now().toDate(),
          }
        ])
      });
    } on FirebaseException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error posting comment'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final DateTime time = widget.time;
    final String likes = widget.likes;
    final List comments = widget.comments;
    final commentReference =
        FirebaseFirestore.instance.collection('posts').doc(widget.id);
    print(commentReference);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Thread"),
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
      body: ListView(
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
                      color: AppColors.accent,
                    ),
                  ),
                  Text(
                    timeago.format(time),
                    style: const TextStyle(
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 6,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    color: AppColors.accent,
                    onPressed: () {},
                    icon: const Icon(
                      Ionicons.chatbox_ellipses_outline,
                    ),
                  ),
                  Text(
                    comments.length.toString(),
                    style: const TextStyle(
                      color: AppColors.accent,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    color: AppColors.accent,
                    onPressed: () {},
                    icon: const Icon(
                      Ionicons.heart_outline,
                    ),
                  ),
                  Text(
                    likes,
                    style: const TextStyle(
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            // color: Colors.white,
            thickness: 1.8,
          ),
          Column(
            children: List.generate(comments.length, (index) {
              final comment = comments[index];
              final commentTime = comment["time"].toDate();
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
                            color: AppColors.accent,
                          ),
                        ),
                        Text(
                          timeago.format(commentTime),
                          style: const TextStyle(
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        comment['text'],
                        style: const TextStyle(
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _commentController,
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
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
              postComment(_commentController.text);
            }
          }),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  postComment(_commentController.text);
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
      ),
    );
  }
}
