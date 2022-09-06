import 'package:flutter/material.dart';

class LogoutSnackBar extends StatelessWidget {
  const LogoutSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.maxFinite,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.teal,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('You have successfully log-out !')],
        ),
      ),
    );
  }
}
