// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dilo/auth/google_auth.dart';
import 'package:dilo/data/counsellors.dart';
import 'package:dilo/pages/my_bookmarks.dart';
import 'package:dilo/pages/my_posts.dart';
import 'package:dilo/utils/colors.dart';
import 'package:dilo/widgets/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final List listItems = [
    {
      "title": "My Posts",
      "subTitle": "View all your posts",
      "icon": Ionicons.chatbubbles_outline,
      "screen": const MyPosts(),
    },
    {
      "title": "My Bookmarks",
      "subTitle": "View your saved posts",
      "icon": Ionicons.bookmark_outline,
      "screen": const MyBookmarks(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final provider = Provider.of<GoogleAuthenticationProvider>(
            context,
            listen: false,
          );
          provider.googleLogout();
        },
        label: const Text(
          "Logout",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Lottie.asset(
          'assets/arrow.json',
          width: 40,
        ),
        heroTag: 'f1',
        foregroundColor: Colors.white,
        backgroundColor: AppColors.orange,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: [
            const PromoCard(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                "M Y   A N O N Y M O U S",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Column(
              children: List.generate(
                listItems.length,
                (index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          listItems[index]["title"],
                        ),
                        subtitle: Text(
                          listItems[index]["subTitle"],
                        ),
                        trailing: Icon(
                          listItems[index]["icon"],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => listItems[index]["screen"],
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 0,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                "F I N D   C O U N S E L L O R S",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Column(
              children: List.generate(counsellors.length, (index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(counsellors[index]['name']),
                      subtitle: Text(counsellors[index]['phone']),
                      trailing: const Icon(
                        Ionicons.call_outline,
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
