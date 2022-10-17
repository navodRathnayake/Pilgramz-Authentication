import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';

class Messages extends StatefulWidget {
  final ThemeData themedata;
  const Messages({Key? key, required this.themedata}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          VerticalSpace(height: 30),
          TopBar(),
          VerticalSpace(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Pilgrimz Messanger',
                          style: widget.themedata.textTheme.headline1),
                      HorizontalSpace(width: 10),
                      Icon(
                        Icons.verified,
                        color: Colors.teal,
                      )
                    ],
                  ),
                  Text('Connect With Your Beautiful Hearts!'),
                ],
              ),
            ],
          ),
          VerticalSpace(height: 10),
          Row(
            children: [
              Filter(text: 'Friends Zone'),
              HorizontalSpace(width: 10),
              AdvancedFilter(
                  child: Icon(Icons.call, color: Colors.white, size: 15),
                  text: 'Call Logs'),
              HorizontalSpace(width: 10),
              Filter(text: 'Add Friends'),
            ],
          ),
          VerticalSpace(height: 10),
          Expanded(
            child: ListView(
              children: [
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/women/25.jpg',
                    name: 'Ann Jorgea',
                    message: 'I will send the mail later',
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 14,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('1',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    )),
                Divider(),
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/women/66.jpg',
                    name: 'Julia Androo',
                    message: 'Hey, I just came there, send me the nu...',
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 14,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text('6',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    )),
                Divider(),
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/men/99.jpg',
                    name: 'James NV',
                    message: 'Bro, Did you visit there',
                    child: Container()),
                Divider(),
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/women/46.jpg',
                    name: 'Diana Mc',
                    message: 'I met your school friend yesterday',
                    child: Container()),
                Divider(),
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/men/89.jpg',
                    name: 'Luke',
                    message: 'Luke sent an attachment',
                    child: Container()),
                Divider(),
                MessageListTile(
                    url: 'https://randomuser.me/api/portraits/women/78.jpg',
                    name: 'Stefenie Roz',
                    message: 'Zounds good',
                    child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 23,
                  child: CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://randomuser.me/api/portraits/women/12.jpg",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}

class Filter extends StatelessWidget {
  final String text;
  const Filter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AdvancedFilter extends StatelessWidget {
  final Widget child;
  final String text;
  const AdvancedFilter({super.key, required this.child, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            child,
            HorizontalSpace(width: 5),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  final String url;
  final String name;
  final String message;
  final bool isSeen;
  const MessageList(
      {super.key,
      required this.url,
      required this.name,
      required this.message,
      required this.isSeen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 33,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
      title: Text(name, style: TextStyle(color: Colors.black)),
      subtitle: Text(message, style: TextStyle(color: Colors.grey)),
    );
  }
}

class MessageListTile extends StatelessWidget {
  final String url;
  final String name;
  final String message;
  Widget child;
  MessageListTile(
      {super.key,
      required this.url,
      required this.name,
      required this.message,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            HorizontalSpace(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  message,
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
        child
      ],
    );
  }
}
