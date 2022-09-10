import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dilo/widgets/empty_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyBookmarks extends StatefulWidget {
  const MyBookmarks({Key? key}) : super(key: key);

  @override
  State<MyBookmarks> createState() => _MyBookmarksState();
}

class _MyBookmarksState extends State<MyBookmarks> {
  final bookmarksReference = FirebaseFirestore.instance.collection('bookmarks');
  // .where('bookmarkBy', isEqualTo: FirebaseAuth.instance.currentUser!.uid)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookmarks"),
      ),
      body: StreamBuilder(
        stream: bookmarksReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.size == 0) {
              return const EmptyPage(
                text: "Your bookmarks will appear here!",
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return const Text("Hey there");
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
