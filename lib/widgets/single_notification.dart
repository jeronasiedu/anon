// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:kcapp/utils/notification_types.dart';

class SingleNotification extends StatelessWidget {
  const SingleNotification({
    Key? key,
    required this.time,
    required this.post,
    required this.type,
  }) : super(key: key);

  final String time;
  final String post;
  final NotificationType type;
  final NotificationType like = NotificationType.like;
  final NotificationType comment = NotificationType.comment;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: "A",
          style: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 16,
              ),
          children: [
            TextSpan(
              text: type == like ? " like" : " comment",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: " on your post",
            ),
          ],
        ),
      ),
      subtitle: Text(
        post,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(time),
      onTap: () {},
      leading: type == like
          ? const Icon(
              Ionicons.heart,
            )
          : const Icon(
              Ionicons.chatbox,
            ),
      iconColor: type == like ? AppColors.red : AppColors.turquoise,
    );
  }
}
