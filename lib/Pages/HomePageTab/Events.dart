import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';
import 'package:pilgramz/Utils/jason.dart';

class Events extends StatefulWidget {
  final ThemeData themedata;
  const Events({Key? key, required this.themedata}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: date.length,
                itemBuilder: (context, index) => Calender(
                    date: date[index],
                    day: day[index],
                    themedata: widget.themedata),
              ),
            ),
            VerticalSpace(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarWidget(
                    url: "https://randomuser.me/api/portraits/women/1.jpg"),
                HorizontalSpace(width: 5),
                AvatarWidget(
                    url: "https://randomuser.me/api/portraits/women/24.jpg"),
                HorizontalSpace(width: 5),
                AvatarWidget(
                    url: "https://randomuser.me/api/portraits/women/56.jpg"),
                HorizontalSpace(width: 5),
                AvatarWidget(
                    url: "https://randomuser.me/api/portraits/women/75.jpg"),
                HorizontalSpace(width: 5),
                AvatarWidget(
                    url: "https://randomuser.me/api/portraits/women/23.jpg")
              ],
            ),
            Text(
              'Enjoy your time with your connected friends',
            ),
            Text('& Joining with'),
            Text('Pilgramz growing e-events'),
            VerticalSpace(height: 10),
            const Divider(),
            VerticalSpace(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Pilgram 1.0.0V',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calender extends StatefulWidget {
  final String date;
  final String day;
  final ThemeData themedata;
  const Calender(
      {super.key,
      required this.date,
      required this.day,
      required this.themedata});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  bool isSelected = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(widget.date, style: TextStyle(color: Colors.black)),
                VerticalSpace(height: 10),
                Text(
                  widget.day,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  final String url;
  const AvatarWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: Stack(children: [
      CircleAvatar(
        radius: 15,
        child: CircleAvatar(
          radius: 12,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          //backgroundColor: Colors.black,
        ),
      ),
    ])));
  }
}
