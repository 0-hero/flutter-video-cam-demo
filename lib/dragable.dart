import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class Drag extends StatefulWidget {
  Drag({Key key}) : super(key: key);
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  double top = 0;
  double left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag example'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(30),
        height: 300,
        width: 300,
        color: Colors.indigo.shade100,
        child: Draggable(
          child: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          feedback: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.only(top: top, left: left),
            child: DragItem(),
          ),
          onDragCompleted: () {},
          onDragEnd: (drag) {
            setState(() {
              if ((top + drag.offset.dy) > (300.0 - 30.0)) {
                top = (300.0 - 30.0);
              } else if ((top + drag.offset.dy - 30.0) < 0.0) {
                top = 0;
              } else {
                top = top + drag.offset.dy - 30.0;
              }
              if ((left + drag.offset.dx) > (300.0 - 30.0)) {
                left = (300.0 - 30.0);
              } else if ((left + drag.offset.dx - 30.0) < 0.0) {
                left = 0;
              } else {
                left = left + drag.offset.dx - 30.0;
              }
            });
          },
        ),
      ),
    );
  }
}

class DragItem extends StatelessWidget {
  CameraController controller;

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: _cameraPreviewWidget(),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: controller != null && controller.value.isRecordingVideo
              ? Colors.redAccent
              : Colors.grey,
          width: 3.0,
        ),
      ),
    );
  }
}
