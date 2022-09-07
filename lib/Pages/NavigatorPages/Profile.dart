import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilgramz/Custom%20Widgets/HorizontalSpace.dart';
import 'package:pilgramz/Custom%20Widgets/VerticalSpace.dart';
import 'package:pilgramz/Utils/jason.dart';

class Profile extends StatefulWidget {
  final ThemeData themedata;
  const Profile({Key? key, required this.themedata}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var destinationImages;
    return Container(
      child: Column(
        children: [
          VerticalSpace(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: ProfileAvatar(
                  url: "https://randomuser.me/api/portraits/women/26.jpg",
                )),
              ),
              HorizontalSpace(width: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bobbie Ann Stevens',
                        style: widget.themedata.textTheme.headline3),
                    Text('Stevens',
                        style: widget.themedata.textTheme.headline3),
                    Text('bobbie.stevens@example.com'),
                    VerticalSpace(height: 10),
                    //Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //children: [
                    //profileTags(count: '12', child: Icon(Icons.pets)),
                    //HorizontalSpace(width: 10),
                    //profileTags(count: '236K', child: Icon(Icons.share)),
                    //HorizontalSpace(width: 10),
                    //profileTags(count: '21K', child: Icon(Icons.favorite)),
                    //],
                    //),
                    ElevatedButton(onPressed: () {}, child: Text('Follow'))
                  ],
                ),
              ),
            ],
          ),
          VerticalSpace(height: 10),
          const Divider(),
          Container(
            color: Colors.grey[400],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                profileTags(
                    count: '12',
                    child: Icon(
                      Icons.pets,
                      color: Colors.blueGrey,
                    )),
                HorizontalSpace(width: 10),
                profileTags(
                    count: '236K',
                    child: Icon(
                      Icons.share,
                      color: Colors.blueGrey,
                    )),
                HorizontalSpace(width: 10),
                profileTags(
                    count: '21K',
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blueGrey,
                    )),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: profilePost.length,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 70,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: profilePost[index],
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatefulWidget {
  final String url;
  const ProfileAvatar({super.key, required this.url});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 55,
            child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.url,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  placeholder: (context, url) => CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Icon(Icons.add_a_photo),
            ),
          )
        ],
      ),
    );
  }
}

class profileTags extends StatelessWidget {
  final String count;
  final Widget child;
  const profileTags({super.key, required this.count, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(count, style: TextStyle(color: Colors.white)),
            VerticalSpace(height: 0),
            Container(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
