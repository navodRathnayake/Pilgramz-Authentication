import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pilgramz/API/Auth/AuthServices.dart';
import 'package:pilgramz/SnackBars/LogoutSnackBar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("root");
            },
            icon: IconTheme(
              data: themedata.iconTheme,
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            )),
        title: Text(
          "Settings",
          style: themedata.textTheme.headlineLarge,
        ),
        // actions: const [
        //   IconTheme(data: IconThemeData(), child: Icon(Icons.more_vert)),
        // ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(33.33),
          child: Container(),
        ),
        elevation: 0.0,
        backgroundColor: themedata.scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          const Divider(),
          ListTile(
            leading: IconTheme(
              data: themedata.primaryIconTheme,
              child: const Icon(
                Icons.dark_mode,
              ),
            ),
            title: Text(
              "DARK MODE ON / OFF",
              style: themedata.textTheme.headline1,
            ),
            subtitle: Text("Change your UI theme"),
            trailing: Switch(value: true, onChanged: (isTrue) {}),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: IconTheme(
              data: themedata.primaryIconTheme,
              child: const Icon(
                Icons.logout,
              ),
            ),
            title: Text(
              "Logout",
              style: themedata.textTheme.headline1,
            ),
            subtitle: Text("Logout from this account"),
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Pilgramz Logout'),
                  content: const Text(
                      'Because of the security reasons, We are going to exit Pilgramz'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        AuthServices().signOut();
                        exit(0);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );

              // AuthServices().signOut();
              // ScaffoldMessenger.of(context)
              //   ..removeCurrentSnackBar()
              //   ..showSnackBar(SnackBar(
              //     backgroundColor: Colors.white,
              //     content: const LogoutSnackBar(),
              //   ));
            },
          ),
        ],
      ),
    );
  }
}
