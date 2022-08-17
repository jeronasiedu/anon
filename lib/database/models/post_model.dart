// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostModel {
  final String text;
  final time = Timestamp.now().toDate();
  List likes = [];
  List comments = [];
  final String authorId = FirebaseAuth.instance.currentUser!.uid;
  PostModel({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'time': time,
      'likes': likes,
      'comments': comments,
      'authorId': authorId,
    };
  }

  // static PostModel fromMap(Map<String, dynamic> map) {
  //   return PostModel(
  //     text: map['text'],
  //     time: DateTime.fromMillisecondsSinceEpoch(map['time']),
  //     likes: map['likes'],
  //     comments: map['comments'],
  //     authorId: map['authorId'],
  //   );
  // }
}
