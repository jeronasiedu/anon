import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kcapp/pages/home.dart';
import 'package:kcapp/pages/notifications.dart';
import 'package:kcapp/pages/profile.dart';
import 'package:kcapp/utils/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const NotificationsPage(),
    ProfilePage(),
  ];
  List indicatorColors = [
    AppColors.orange,
    AppColors.turquoise,
    AppColors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          elevation: 40,
          indicatorColor: indicatorColors[currentIndex],
          iconTheme: MaterialStateProperty.all(
            const IconThemeData(
              size: 20,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          height: 70,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                FeatherIcons.home,
              ),
              label: "Home",
              selectedIcon: Icon(
                FeatherIcons.home,
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                FeatherIcons.bell,
              ),
              selectedIcon: Icon(
                FeatherIcons.bell,
                color: Colors.white,
              ),
              label: "Notifications",
            ),
            NavigationDestination(
              icon: Icon(
                FeatherIcons.user,
              ),
              selectedIcon: Icon(
                FeatherIcons.user,
                color: Colors.white,
              ),
              label: "Me",
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
    );
  }
}
