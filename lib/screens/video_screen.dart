import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:yellow_class/video_player/controls.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class VideoScreen extends StatefulWidget {
  String url;

  VideoScreen(String url) {
    this.url = url;
  }
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  FlickManager flickManager;
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;
  DragController dragController = DragController();

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display camera preview
  Widget cameraPreview() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }
    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.url));
    availableCameras().then((value) {
      cameras = value;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 1;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {});
      } else {
        print('No camera available');
      }
    }).catchError((e) {
      print('Error : ${e.code}');
    });
  }

  @override
  void dispose() {
    flickManager.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlickVideoPlayer(
            flickManager: flickManager,
            preferredDeviceOrientation: [
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft
            ],
            systemUIOverlay: [],
            flickVideoWithControls: FlickVideoWithControls(
              controls: LandscapePlayerControls(),
            ),
          ),
          DraggableWidget(
            bottomMargin: 30,
            topMargin: 20,
            intialVisibility: true,
            horizontalSapce: 0,
            shadowBorderRadius: 0,
            child: Container(
              height: 150,
              margin: const EdgeInsets.all(1.0),
              padding: const EdgeInsets.all(1.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.yellowAccent)),
              child: RotatedBox(
                quarterTurns: 3,
                child: Container(
                  height: 150,
                  child: cameraPreview(),
                ),
              ),
            ),
            initialPosition: AnchoringPosition.bottomLeft,
            dragController: dragController,
          ),
        ],
      ),
    );
  }

  showCameraException(e) {
    String errorText = 'Error ${e.code} \nError message: ${e.description}';
  }
}
