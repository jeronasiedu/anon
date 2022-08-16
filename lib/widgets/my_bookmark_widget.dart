// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/pages/post_details.dart';
import 'package:kcapp/utils/colors.dart';

class MyBookmarkWidget extends StatelessWidget {
  const MyBookmarkWidget({
    Key? key,
    required this.text,
    required this.likes,
    required this.comments,
    required this.time,
  }) : super(key: key);

  final String text;
  final String likes;
  final String comments;
  final String time;
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
                )),
          ),
        );
      },
      child: ChatBubble(
        backGroundColor: AppColors.cardBg,
        margin: const EdgeInsets.only(bottom: 10),
        clipper: ChatBubbleClipper1(
          type: BubbleType.sendBubble,
        ),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
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
                    comments,
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
                  const Spacer(),
                  IconButton(
                    color: AppColors.accent,
                    onPressed: () {},
                    splashRadius: 22,
                    icon: const Icon(
                      Ionicons.bookmark,
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
