import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Utils/jason.dart';

import '../HorizontalSpace.dart';
import '../VerticalSpace.dart';

class DestinationSheet extends StatefulWidget {
  final ThemeData themedata;
  const DestinationSheet({super.key, required this.themedata});

  @override
  State<DestinationSheet> createState() => _DestinationSheetState();
}

class _DestinationSheetState extends State<DestinationSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Column(children: [
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
              VerticalSpace(height: 10),
              const Divider(),
              VerticalSpace(height: 10),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: destinationImages.length,
                    itemBuilder: (context, index) => Container(
                      child: Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: destinationImages[index],
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  foregroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text('Enroll With 3D'),
              ),
            ])),
      ),
    );
  }
}
