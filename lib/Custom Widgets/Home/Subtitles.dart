import 'package:flutter/material.dart';
import 'package:pilgramz/Utils/Theme%20Data.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class Subtitles extends StatelessWidget {
  final ThemeData themedata;
  final String leadingText;
  final String tailText;
  const Subtitles(
      {Key? key,
      required this.leadingText,
      required this.tailText,
      required this.themedata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leadingText, style: themedata.textTheme.headline1),
          TextButton(
            onPressed: () {},
            child: Container(
              child: Row(
                children: [
                  Text(
                    tailText,
                    style: themedata.textTheme.subtitle1,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: COLOR_GREY_CANVAS,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinationsSubTitle extends StatefulWidget {
  final ThemeData themedata;
  const DestinationsSubTitle({Key? key, required this.themedata})
      : super(key: key);

  @override
  State<DestinationsSubTitle> createState() => _DestinationsSubTitleState();
}

class _DestinationsSubTitleState extends State<DestinationsSubTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Destinations",
            style: widget.themedata.textTheme.subtitle1,
          ),
          dropDownMenu(widget.themedata)
        ],
      ),
    );
  }
}

Widget dropDownMenu(ThemeData themedata) {
  String selected = "";
  return Container(
      child: PopupMenuButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          icon: Icon(
            Icons.widgets,
            color: COLOR_GREY_CANVAS,
          ),
          onSelected: (value) => selected,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                PopupMenuItem<Menu>(
                    value: Menu.itemOne, child: Text('Select # of columns')),
                PopupMenuDivider(),
                PopupMenuItem<Menu>(
                  value: Menu.itemOne,
                  child: ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      'Columns - 01',
                      style: themedata.textTheme.headline3,
                    ),
                  ),
                ),
                PopupMenuItem<Menu>(
                  value: Menu.itemOne,
                  child: ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      'Columns - 02',
                      style: themedata.textTheme.headline3,
                    ),
                  ),
                ),
                PopupMenuItem<Menu>(
                  value: Menu.itemOne,
                  child: ListTile(
                    leading: Icon(Icons.list),
                    title: Text(
                      'Columns - 03',
                      style: themedata.textTheme.headline3,
                    ),
                  ),
                ),
              ]));
}
