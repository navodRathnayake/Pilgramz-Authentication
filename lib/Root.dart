import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:pilgramz/Pages/MyHomePage.dart';
import 'package:pilgramz/Pages/NavigatorPages/Messages.dart';
import 'package:pilgramz/Pages/NavigatorPages/Notifications.dart';
import 'package:pilgramz/Pages/NavigatorPages/Profile.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData themedata = Theme.of(context);
    final screens = [
      MyHomePage(themedata: themedata),
      Profile(themedata: themedata),
      Messages(themedata: themedata),
      PilgramzNotifications()
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        backgroundColor: themedata.scaffoldBackgroundColor,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
              activeColor: Colors.teal,
              icon: IconTheme(
                  data: themedata.iconTheme,
                  child: const Icon(
                    Icons.home,
                  )),
              title: const Text('Home')),
          BottomNavyBarItem(
              activeColor: Colors.teal,
              icon: IconTheme(
                  data: themedata.iconTheme, child: const Icon(Icons.person)),
              title: const Text('Profile')),
          BottomNavyBarItem(
              activeColor: Colors.teal,
              icon: IconTheme(
                  data: themedata.iconTheme, child: const Icon(Icons.message)),
              title: const Text('Message')),
          BottomNavyBarItem(
              activeColor: Colors.teal,
              icon: IconTheme(
                  data: themedata.iconTheme,
                  child: const Icon(Icons.notifications)),
              title: const Text('Notifications')),
        ],
      ),
    );
  }
}
