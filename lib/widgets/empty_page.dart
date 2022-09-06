// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;
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
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Text(
              text ?? "No posts yet, share your thoughts and come back later",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
