// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/pages/post_details.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class Post extends StatelessWidget {
  Post({
    Key? key,
    required this.text,
    required this.likes,
    required this.comments,
    required this.time,
    required this.id,
  }) : super(key: key);

  final String text;
  final List likes;
  final List comments;
  final DateTime time;
  final String id;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> likePost(
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(id).update(
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => PostDetails(
                  comments: comments,
                  text: text,
                  likes: likes,
                  time: time,
                  id: id,
                )),
          ),
        );
      },
      child: ChatBubble(
        backGroundColor: AppColors.cardBg,
        margin: const EdgeInsets.only(bottom: 10),
        clipper: ChatBubbleClipper3(
          type: BubbleType.sendBubble,
        ),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeago.format(time),
                style: const TextStyle(
                  color: AppColors.accent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(
                    color: AppColors.accent,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.chatbox_ellipses_outline,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    Text(
                      comments.length.toString(),
                      style: const TextStyle(
                        color: AppColors.accent,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        likePost(context);
                      },
                      icon: likes.contains(userId)
                          ? const Icon(
                              Ionicons.heart_outline,
                              color: AppColors.accent,
                            )
                          : const Icon(
                              Ionicons.heart,
                              color: AppColors.red,
                            ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    Text(
                      likes.length.toString(),
                      style: const TextStyle(
                        color: AppColors.accent,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 22,
                      icon: const Icon(
                        Ionicons.bookmark_outline,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
