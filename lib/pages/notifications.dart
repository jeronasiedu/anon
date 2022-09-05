import 'package:dilo/utils/notification_examples.dart';
import 'package:dilo/widgets/single_notification.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        itemBuilder: (context, index) {
          return SingleNotification(
            time: notifications[index]['time'],
            type: notifications[index]['type'],
            post: notifications[index]['post'],
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1,
        ),
        itemCount: notifications.length,
      ),
    );
  }
}
