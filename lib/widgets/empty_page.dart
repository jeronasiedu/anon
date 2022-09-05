import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/push_chat.svg',
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "No posts yet, share your thoughts and come back later",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
