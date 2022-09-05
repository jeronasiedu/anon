// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dilo/pages/post_details.dart';
import 'package:dilo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class MyPostWidget extends StatelessWidget {
  const MyPostWidget({
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                DateFormat('h:mm a').format(time),
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
                    color: AppColors.accent,
                    onPressed: () {},
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
                  const Spacer(),
                  IconButton(
                    color: AppColors.accent,
                    onPressed: () {},
                    splashRadius: 22,
                    icon: const Icon(
                      Ionicons.bookmark_outline,
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
