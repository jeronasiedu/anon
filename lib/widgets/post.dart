// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.text,
    required this.likes,
    required this.comments,
    required this.time,
    required this.color,
  }) : super(key: key);

  final String text;
  final String likes;
  final String comments;
  final String time;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      backGroundColor: color,
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
              time,
              style: TextStyle(
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 6,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/chat.svg',
                  width: 25,
                  color: Colors.grey[100],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    comments,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Ionicons.heart_outline,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    likes,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/pin.svg',
                  width: 25,
                  color: Colors.grey[100],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
