// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dilo/pages/post_details.dart';
import 'package:dilo/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:ionicons/ionicons.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyPostWidget extends StatelessWidget {
  MyPostWidget({
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

  Future<void> deletePost(BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(id).delete();
    } on FirebaseException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error deleting post'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error deleting post'),
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
        clipper: ChatBubbleClipper4(
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
                    onPressed: () {
                      likePost(context);
                    },
                    icon: likes.contains(userId)
                        ? const Icon(
                            Ionicons.heart,
                            color: AppColors.yellow,
                          )
                        : const Icon(
                            Ionicons.heart_outline,
                            color: AppColors.accent,
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
                    color: AppColors.accent,
                    onPressed: () {
                      deletePost(context);
                    },
                    splashRadius: 22,
                    icon: const Icon(
                      Ionicons.trash_bin_outline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
