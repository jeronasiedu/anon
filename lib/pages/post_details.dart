// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:ionicons/ionicons.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({
    Key? key,
    required this.text,
    required this.time,
    required this.likes,
    required this.comments,
    required this.color,
  }) : super(key: key);
  final String text;
  final String time;
  final String likes;
  final String comments;
  final Color color;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final _commentController = TextEditingController();
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final String time = widget.time;
    final String likes = widget.likes;
    final String comments = widget.comments;
    final Color color = widget.color;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Picture of the day"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: const Icon(
              FeatherIcons.mapPin,
            ),
          ),
        ],
      ),
      body: ColoredBox(
        color: color,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
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
                        fontSize: 18,
                      ),
                      maxLines: 6,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(
                          Ionicons.chatbox_ellipses_outline,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          comments,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        color: Colors.white,
                        onPressed: () {},
                        icon: const Icon(
                          Ionicons.heart_outline,
                        ),
                      ),
                      Text(
                        likes,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1.8,
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _commentController,
          textInputAction: TextInputAction.send,
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          minLines: 1,
          style: const TextStyle(
            fontSize: 17,
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Why do you want to post an empty comment?';
            }
            return null;
          },
          onFieldSubmitted: ((value) {
            if (_commentController.text.isNotEmpty) {
              print(_commentController.text);
              _commentController.clear();
            }
          }),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  print(_commentController.text);
                  _commentController.clear();
                }
              },
              icon: const Icon(Ionicons.rocket),
            ),
            contentPadding: const EdgeInsets.all(12),
            hintText: "Don't be shy, share your comment!",
            border: const UnderlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
