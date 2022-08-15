// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:kcapp/utils/notification_types.dart';

class SingleNotification extends StatelessWidget {
  const SingleNotification({
    Key? key,
    required this.time,
    required this.type,
  }) : super(key: key);

  final String time;
  final notificationsType type;
  final notificationsType like = notificationsType.like;
  final notificationsType comment = notificationsType.comment;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: "An",
          style: DefaultTextStyle.of(context).style,
          children: [
            const TextSpan(
              text: " Anon",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: " user",
            ),
            TextSpan(
              text:
                  type == like ? " liked your post" : " commented on your post",
            ),
          ],
        ),
      ),
      subtitle: Text(time),
      onTap: () {},
      leading: type == like
          ? const Icon(
              Ionicons.heart,
            )
          : const Icon(
              Ionicons.chatbox,
            ),
      iconColor: type == like ? appColors.red : appColors.turquoise,
    );
  }
}
