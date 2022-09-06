import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  late double height;
  VerticalSpace({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
