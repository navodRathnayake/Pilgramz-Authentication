import 'package:flutter/material.dart';

class PilgramzNotifications extends StatefulWidget {
  const PilgramzNotifications({Key? key}) : super(key: key);

  @override
  State<PilgramzNotifications> createState() => _PilgramzNotificationsState();
}

class _PilgramzNotificationsState extends State<PilgramzNotifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('This is the notification Page'),
        ],
      ),
    );
  }
}
