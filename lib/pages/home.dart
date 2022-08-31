import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kcapp/pages/create_post.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:kcapp/widgets/post.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  final postReference = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('time', descending: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'D I L O',
        ),
      ),
      body: StreamBuilder(
        stream: postReference.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              color: AppColors.blue,
              onRefresh: handleRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];

                  var data = doc.data() as Map;
                  DateTime time = data['time'].toDate();
                  return Post(
                    comments: data['comments'],
                    likes: data['likes'],
                    text: data['text'],
                    time: time,
                    id: doc.id,
                  );
                },
              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePost(),
            ),
          );
        },
        heroTag: 'f2',
        child: Lottie.asset(
          'assets/pen.json',
          width: 40,
        ),
      ),
    );
  }
}
