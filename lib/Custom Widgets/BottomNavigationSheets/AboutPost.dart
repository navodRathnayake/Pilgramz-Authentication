import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';
import 'package:pilgramz/Utils/jason.dart';

class AboutPost extends StatefulWidget {
  final ThemeData themedata;
  const AboutPost({super.key, required this.themedata});

  @override
  State<AboutPost> createState() => _AboutPostState();
}

class _AboutPostState extends State<AboutPost> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: ListView(
            controller: scrollController,
            children: [
              VerticalSpace(height: 10),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              VerticalSpace(height: 10),
              PostAvatar(themedata: widget.themedata),
              const Divider(),
              //VerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.rotate(
                    angle: 3.1,
                    child: Icon(Icons.format_quote),
                  ),
                ],
              ),
              Row(
                children: [
                  HorizontalSpace(width: 12),
                  Expanded(
                    child: Text(
                      'Ultimate Sri Lanka Street Food Tour In Colombo With The Kindest Vendors',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: widget.themedata.textTheme.headline4,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HorizontalSpace(width: 12),
                        Icon(Icons.access_time, color: Colors.grey),
                        HorizontalSpace(width: 10),
                        Text('2022.08.11 / 08:57 pm')
                      ],
                    ),
                    Row(
                      children: [
                        HorizontalSpace(width: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            foregroundColor: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () {},
                          child: const Text('Navigate me'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                lorem,
                style: TextStyle(
                  color: Colors.grey[700],
                  debugLabel: 'post data',
                ),
                textAlign: TextAlign.justify,
              ),
              VerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(),
                  HorizontalSpace(width: 10),
                  CircleAvatar(),
                  HorizontalSpace(width: 10),
                  CircleAvatar(),
                ],
              ),
              VerticalSpace(height: 10),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostAvatar extends StatelessWidget {
  final ThemeData themedata;
  const PostAvatar({super.key, required this.themedata});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  child: CircleAvatar(
                    radius: 50,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    //backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          HorizontalSpace(width: 15),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Navod Rathnayake',
                          style: themedata.textTheme.headline2,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        'Rathnayake',
                        style: themedata.textTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('navodhosts@gmail.com',
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      CircleAvatar(
                        child: Icon(
                          Icons.send,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        onPressed: () {},
                        child: const Text('Follow'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
