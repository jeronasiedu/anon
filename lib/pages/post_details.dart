// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dilo/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
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
  final List likes;
  final List comments;
  final String id;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final _commentController = TextEditingController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> likePost(
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.id)
          .update(
        {
          'likes': FieldValue.arrayUnion([userId])
        },
      );
    } on FirebaseException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error liking post'),
        ),
      );
    }
  }

  Future<void> postComment(
    String text,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.id)
          .update(
        {
          'comments': FieldValue.arrayUnion([
            {
              'text': text,
              'time': Timestamp.now().toDate(),
            }
          ])
        },
      );
      _commentController.clear();
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
    final List likes = widget.likes;
    final List comments = widget.comments;
    final commentReference = FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.id)
        .snapshots();

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
        physics: const BouncingScrollPhysics(),
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
                  const Icon(Ionicons.chatbox_ellipses_outline),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      comments.length.toString(),
                      style: const TextStyle(
                        color: AppColors.accent,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    color: AppColors.accent,
                    onPressed: () {
                      likePost(context);
                    },
                    icon: const Icon(
                      Ionicons.heart_outline,
                    ),
                  ),
                  Text(
                    likes.length.toString(),
                    style: const TextStyle(
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 1.8,
          ),
          StreamBuilder(
            stream: commentReference,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                const Center(
                  child: Text('There was an erro fetching comments'),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Lottie.asset(
                    'assets/loading.json',
                    width: 100,
                  ),
                );
              }
              return Column(
                children: List.generate(
                  snapshot.data.data()['comments'].length,
                  (index) {
                    final comment = snapshot.data
                        .data()['comments']
                        .reversed
                        .toList()[index];
                    DateTime time = comment['time'].toDate();
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
                  },
                ),
              );
            },
          ),
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
              FocusScope.of(context).unfocus();
            }
          }),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  postComment(_commentController.text);
                  FocusScope.of(context).unfocus();
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
