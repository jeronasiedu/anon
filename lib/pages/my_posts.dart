import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kcapp/widgets/my_post_widget.dart';
import 'package:lottie/lottie.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  late String? authorId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    final user = auth.currentUser;
    super.initState();
    setState(() {
      authorId = user?.uid;
    });
  }

  final postReference = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('time', descending: true)
      .where(
        'authorId',
        isEqualTo: '',
      );

  @override
  Widget build(BuildContext context) {
    print(authorId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My posts"),
      ),
      body: StreamBuilder(
        stream: postReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data!.docs[index];
                var data = doc.data() as Map;
                DateTime time = data['time'].toDate();
                return MyPostWidget(
                  comments: data['comments'],
                  likes: data['likes'].length.toString(),
                  text: data['text'],
                  time: time,
                  id: doc.id,
                );
              },
            );
          }
          return Center(
            child: Lottie.asset(
              'assets/loading.json',
              width: 200,
            ),
          );
        },
      ),
    );
  }
}
