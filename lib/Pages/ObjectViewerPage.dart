import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class ObjectViewerPage extends StatefulWidget {
  final String pageTitle;
  final String objPath;
  const ObjectViewerPage(
      {super.key, required this.pageTitle, required this.objPath});

  @override
  State<ObjectViewerPage> createState() => _ObjectViewerPageState();
}

class _ObjectViewerPageState extends State<ObjectViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Container(
        color: Colors.blue,
        child: Cube(
          onSceneCreated: (scene) {
            scene.world.add(Object(fileName: widget.objPath));
          },
        ),
      ),
    );
  }
}
