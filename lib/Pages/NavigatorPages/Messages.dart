import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Cube(
              onSceneCreated: (scene) {
                scene.world.add(
                    Object(fileName: 'assests/3D models/Eiffel Tower.obj'));
              },
            ),
          ),
        ),
      ],
    );
  }
}
