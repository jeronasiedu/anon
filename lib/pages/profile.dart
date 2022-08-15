// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kcapp/widgets/promo_card.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  List listItems = [
    {
      "title": "My Questions",
      "subTitle": "View all the questions you've asked",
      "image": "assets/question.svg"
    },
    {
      "title": "My Replies",
      "subTitle": "Check what your friends think",
      "image": "assets/chat.svg"
    },
    {
      "title": "My UpVotes",
      "subTitle": "Check which comments were helpful",
      "image": "assets/check.svg"
    },
    {
      "title": "My Pins",
      "subTitle": "View your pinned questions",
      "image": "assets/pin.svg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          children: [
            const PromoCard(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                "MY A N O NA",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          listItems[index]['image'],
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            listItems[index]['title'],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Text(
                          listItems[index]['subTitle'],
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      textColor: Colors.grey[700],
      iconColor: Colors.grey,
      trailing: const Icon(
        FeatherIcons.chevronRight,
      ),
      onTap: () {},
      style: ListTileStyle.drawer,
    );
  }
}
