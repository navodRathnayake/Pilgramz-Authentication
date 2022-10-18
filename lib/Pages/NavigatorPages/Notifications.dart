import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';

class PilgramzNotifications extends StatefulWidget {
  ThemeData themedata;
  PilgramzNotifications({Key? key, required this.themedata}) : super(key: key);

  @override
  State<PilgramzNotifications> createState() => _PilgramzNotificationsState();
}

class _PilgramzNotificationsState extends State<PilgramzNotifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          VerticalSpace(height: 25),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification',
                    style: widget.themedata.textTheme.headline1),
                Icon(Icons.notifications),
              ],
            ),
          ),
          CustomMainCard(themedata: widget.themedata),
        ],
      ),
    );
  }
}

class CustomMainCard extends StatelessWidget {
  ThemeData themedata;
  CustomMainCard({super.key, required this.themedata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            VerticalSpace(height: 10),
            Row(
              children: [
                Container(
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('assests/images/notification.png')),
                ),
                HorizontalSpace(width: 10),
                Text('Welcome to Pilgrimz',
                    style: themedata.textTheme.headline3),
              ],
            ),
            Text(
              'This is the sample notification for pilgrimz demo mode\n that represents the final looks of a notification snap!',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
            VerticalSpace(height: 30)
          ],
        ),
      ),
    );
  }
}
