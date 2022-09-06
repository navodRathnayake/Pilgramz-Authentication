import 'package:flutter/material.dart';
import 'package:pilgramz/API/Auth/AuthServices.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Utils/Theme%20Data.dart';
import 'package:pilgramz/Utils/jason.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PilgramzAppBar extends StatefulWidget {
  late double unit;
  final ThemeData themedata;
  PilgramzAppBar({Key? key, required this.unit, required this.themedata})
      : super(key: key);

  @override
  State<PilgramzAppBar> createState() => _PilgramzAppBarState();
}

class _PilgramzAppBarState extends State<PilgramzAppBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double unitSize = (size.width) / 8;
    return Container(
      width: double.maxFinite,
      height: unitSize * (5 / 4),
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                ProfileAvatar(unit: unitSize),
                HorizontalSpace(width: unitSize / 4),
                AppBarLabel(
                  userName: profileData["userName"],
                  firstName: profileData["firstName"],
                  lastName: profileData["lastName"],
                  unitSize: unitSize,
                  themedata: widget.themedata,
                ),
              ],
            ),
          ),
          settings(
              width: unitSize * (5 / 4),
              height: unitSize * (5 / 4),
              unitSize: unitSize,
              themedata: widget.themedata),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  late double unit;
  ProfileAvatar({Key? key, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthServices().signOut();
      },
      child: Container(
        //color: Colors.red,
        width: unit * (5 / 4),
        child: Stack(
          children: [
            CircleAvatar(
                radius: unit * (10 / 4),
                backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!
                    .photoURL!) //NetworkImage(profileData["profile"]),
                //backgroundColor: Colors.black,
                ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: addStoryButton(unit, context),
            )
          ],
        ),
      ),
    );
  }
}

Widget addStoryButton(double unit, context) {
  return Container(
    width: unit * (2 / 5),
    height: unit * (2 / 5),
    decoration: BoxDecoration(
        color: COLOR_BLUE1,
        shape: BoxShape.circle,
        border: Border.all(color: COLOR_WHITE, width: 2)),
    child: Center(
      child: Icon(
        Icons.add,
        size: unit * (1 / 5),
        color: Colors.white,
      ),
    ),
  );
}

// ProfileAvatar

class AppBarLabel extends StatelessWidget {
  final ThemeData themedata;
  final String userName;
  final String firstName;
  final String lastName;
  late double unitSize;
  AppBarLabel(
      {Key? key,
      required this.userName,
      required this.firstName,
      required this.lastName,
      required this.unitSize,
      required this.themedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: unitSize * (5 / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: themedata.textTheme.headline1,
          ),
          Text(
            firstName + " " + lastName,
            style: themedata.textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}

// Name Section

class settings extends StatelessWidget {
  final ThemeData themedata;
  final double width;
  final double height;
  final double unitSize;
  const settings({
    Key? key,
    required this.width,
    required this.height,
    required this.unitSize,
    required this.themedata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CircleAvatar(
        backgroundColor: themedata.scaffoldBackgroundColor,
        child: Center(
            child: IconButton(
                icon: IconTheme(
                  data: themedata.iconTheme,
                  child: Icon(
                    Icons.settings,
                    size: unitSize * (4 / 7),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("settings");
                })),
      ),
    );
  }
}
