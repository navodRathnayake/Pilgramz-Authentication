import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/BottomNavigationSheets/3dEnvironment.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';
import 'package:pilgramz/Utils/jason.dart';

class Story extends StatefulWidget {
  final ThemeData themedata;
  const Story({Key? key, required this.themedata}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HorizontalSpace(width: 5),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enroll With 3D Tourism',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: metaDataJson.length,
            itemBuilder: (context, index) => Container(
              child: ObjectCard(index: index, themedata: widget.themedata),
            ),
          ),
        )
      ],
    );
  }
}

class ObjectCard extends StatefulWidget {
  final int index;
  final ThemeData themedata;
  const ObjectCard({super.key, required this.index, required this.themedata});

  @override
  State<ObjectCard> createState() => _ObjectCardState();
}

class _ObjectCardState extends State<ObjectCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Environment(
              themedata: widget.themedata,
            );
          },
        );
      },
      child: Container(
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 90,
                child: CachedNetworkImage(
                  imageUrl: metaDataJson[widget.index]['imgurl']!,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              HorizontalSpace(width: 10),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          metaDataJson[widget.index]['title']!,
                          style: widget.themedata.textTheme.headline3,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text('by Pilgram Team'),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.view_in_ar, color: Colors.green),
                            HorizontalSpace(width: 5),
                            Text('Support'),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.red,
                            ),
                            HorizontalSpace(width: 5),
                            Text(metaDataJson[widget.index]['location']!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
