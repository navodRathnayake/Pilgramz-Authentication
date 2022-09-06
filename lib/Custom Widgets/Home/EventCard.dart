import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';

class EventCard extends StatefulWidget {
  final ThemeData themedata;
  final Size size;
  const EventCard({Key? key, required this.themedata, required this.size})
      : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.size.width) * (3 / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: widget.themedata.primaryColor,
      ),
      child: Column(
        children: [
          VerticalSpace(height: (widget.size.height) * (1 / 30)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (widget.size.width) * (1 / 50),
                      height: (widget.size.height) * (1 / 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.amberAccent),
                    ),
                    HorizontalSpace(width: (widget.size.width) * (1 / 25)),
                  ],
                ),
              ),
              Container(
                width: (widget.size.width) * (3 / 4) -
                    ((widget.size.width) * (1 / 25) +
                        (widget.size.width) * (1 / 50)),
                height: (widget.size.height) * (1 / 20),
                child: Text(
                  "Here is the title",
                  style: widget.themedata.textTheme.headline1,
                ),
              )
            ],
          ),
          VerticalSpace(height: (widget.size.width) * (1 / 50)),
          const Divider(),
        ],
      ),
    );
  }
}
