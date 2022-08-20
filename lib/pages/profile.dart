// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/auth/google_auth.dart';
import 'package:kcapp/pages/my_bookmarks.dart';
import 'package:kcapp/pages/my_posts.dart';
import 'package:kcapp/utils/colors.dart';
import 'package:kcapp/widgets/promo_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final List listItems = [
    {
      "title": "My Posts",
      "subTitle": "View all your posts",
      "icon": Ionicons.chatbubbles_outline,
      "screen": MyPosts(),
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
        backgroundColor: AppColors.blue,
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
            )
          ],
        ),
      ),
    );
  }
}
