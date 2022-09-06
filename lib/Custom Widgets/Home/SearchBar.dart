import 'package:flutter/material.dart';
import 'package:pilgramz/Utils/Theme%20Data.dart';

class SearchBar extends StatelessWidget {
  final ThemeData themedata;
  const SearchBar({Key? key, required this.themedata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = (size.width) / 20;
    return Container(
      decoration: BoxDecoration(
          color: themedata.scaffoldBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: Center(
          child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                filled: false,
                alignLabelWithHint: true,
                prefixIcon: IconTheme(
                  data: themedata.iconTheme,
                  child: Icon(
                    Icons.search,
                  ),
                ),
                border: InputBorder.none,
                fillColor: themedata.scaffoldBackgroundColor,
                hintStyle: themedata.textTheme.headline3,
                hintText: "Search Your Destinations",
                prefixStyle: themedata.textTheme.bodyText2,
              ),
              cursorColor: Colors.transparent),
        ),
      ),
    );
  }
}
