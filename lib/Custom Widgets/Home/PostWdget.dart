import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/BottomNavigationSheets/AboutPost.dart';
import 'package:pilgramz/Custom%20Widgets/BottomNavigationSheets/DestinationSheet.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';
import 'package:pilgramz/Utils/Theme%20Data.dart';
import 'package:pilgramz/Utils/jason.dart';

class PostWidget extends StatefulWidget {
  final double width;
  final double padding;
  final ThemeData themedata;
  final String imgUrl;
  final String postTitle;
  final String likes;
  final String comments;
  final String attachments;
  PostWidget(
      {Key? key,
      required this.width,
      required this.padding,
      required this.themedata,
      required this.imgUrl,
      required this.postTitle,
      required this.likes,
      required this.comments,
      required this.attachments})
      : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final double innerPadding = widget.padding / 2;
    final double widthHeight = (widget.width - (2 * widget.padding)) / 2;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return AboutPost(
              themedata: widget.themedata,
            );
          },
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return DestinationSheet(
              themedata: widget.themedata,
            );
          },
        );
      },
      child: Container(
        //width: widthHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //VerticalSpace(height: innerPadding / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: IconTheme(
                    data: widget.themedata.iconTheme,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              color: Colors.white,
              elevation: 0.0,
              child: Column(children: [
                Container(
                  //width: widthHeight,
                  height: widthHeight,
                  child: CachedImage(imgUrl: widget.imgUrl),
                ),
              ]),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: widthHeight / 3,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.pink),
                  ),
                  HorizontalSpace(width: innerPadding),
                  Expanded(
                    child: Text(
                      widget.postTitle,
                      style: TextStyle(color: Colors.black),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpace(height: innerPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PostButtons(
                    themedata: widget.themedata,
                    child: Icon(Icons.favorite_border),
                    amount: postData['likes']),
                PostButtons(
                    themedata: widget.themedata,
                    child: Icon(Icons.chat_bubble_outline),
                    amount: postData['comments']),
                PostButtons(
                    themedata: widget.themedata,
                    child: Icon(Icons.forward_to_inbox),
                    amount: postData['attachments']),
              ],
            ),

            VerticalSpace(height: innerPadding * 2),
          ],
        ),
      ),
    );
  }
}

class PostButtons extends StatefulWidget {
  final Icon child;
  final String amount;
  final ThemeData themedata;
  const PostButtons(
      {Key? key,
      required this.child,
      required this.amount,
      required this.themedata})
      : super(key: key);

  @override
  State<PostButtons> createState() => _PostButtonsState();
}

class _PostButtonsState extends State<PostButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconTheme(
              data: widget.themedata.iconTheme,
              child: IconButton(onPressed: () {}, icon: widget.child)),
          Text(widget.amount)
        ],
      ),
    );
  }
}

class CachedImage extends StatefulWidget {
  final String imgUrl;
  const CachedImage({Key? key, required this.imgUrl}) : super(key: key);

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
