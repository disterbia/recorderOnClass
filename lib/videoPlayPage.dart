import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_video_info/flutter_video_info.dart';

void main() => runApp(VideoPlayPage());

class VideoPlayPage extends StatefulWidget {
  VideoPlayPage({Key key}) : super(key: key);

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  VideoPlayerController vController;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  String videoFile;
  bool isFirst = true;
  VideoData video;
  bool os = Platform.isAndroid;
  var info = FlutterVideoInfo();

  @override
  void dispose() {
    // 자원을 반환하기 위해 VideoPlayerController를 dispose 시키세요.
    vController.dispose();

    super.dispose();
  }

  // Future<void> _startVideoPlayer() async {
  //   vController = VideoPlayerController.file(File(videoFile));
  //   vController.addListener(() {if(!vController.value.isPlaying) setState(() {
  //
  //   });});
  //   await vController.setLooping(true);
  //   await vController.initialize();
  // }

  Future<bool> _startVideoPlayer(String path) async {
    vController = VideoPlayerController.file(File(videoFile));
    video = await info.getVideoInfo(path);
    print("height : ${video.height}");
    print("width : ${video.width}");
    print("orientation : ${video.orientation}");
    videoPlayerListener = () {
      if (videoController != null && videoController.value.size != null) {
        setState(() {});
      }
    };

    vController.addListener(videoPlayerListener);
    await vController.setLooping(true);
    await vController.initialize();
    await videoController?.dispose();
    if (mounted) {
      setState(() {
        videoController = vController;
      });
    }
    return true;
    //await vController.play();
  }
  AppBar appbar =        AppBar(
  title: Text("My Page")
  );
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    var file = arguments["file"];
    videoFile = file;
    return isFirst
        ? FutureBuilder(
            future: _startVideoPlayer(file),
            builder: (context, snapshot) {
              if (video==null)
                return Center(child: CircularProgressIndicator());
              isFirst = false;
              return Scaffold(
                appBar: appbar,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      vController.value.isPlaying
                          ? vController.pause()
                          : vController.play();
                    });
                  },
                  child: Icon(vController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
                body: Column(
                  children: <Widget>[
                    vController == null
                        ? Text("!!")
                        : (vController == null)
                            ? Text("")
                            : RotatedBox(
                                quarterTurns: os ? 0 : 1,
                                child: Center(
                                  child: Container(
                                    width: os
                                        ? video.orientation==0?double.infinity:
                                    MediaQuery.of(context).size.height *
                                        (7 / 16)
                                        : video.width.toDouble() / 8,
                                    height: os
                                        ? video.orientation==0?MediaQuery.of(context).size.width *
                                        (9 / 16):MediaQuery.of(context).size.height-appbar.preferredSize.height*2
                                        : video.height.toDouble() / 8,
                                    child: VideoPlayer(vController),
                                  ),
                                ),
                              ),
                  ],
                ),
              );
            },
          )
        : Scaffold(
            appBar: appbar,
            backgroundColor: Colors.black,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  vController.value.isPlaying
                      ? vController.pause()
                      : vController.play();
                });
              },
              child: Icon(
                  vController.value.isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                vController == null
                    ? Text("")
                    : (vController == null)
                        ? Text("")
                        : RotatedBox(
                            quarterTurns: os ? 0 : 1,
                            child: Center(
                              child: Container(
                                width: os
                                    ? video.orientation==0?double.infinity:
                                MediaQuery.of(context).size.height *
                                    (7 / 16)
                                    : video.width.toDouble() / 8,
                                height: os
                                    ? video.orientation==0?MediaQuery.of(context).size.width *
                                    (9 / 16):MediaQuery.of(context).size.height-appbar.preferredSize.height*2
                                    : video.height.toDouble() / 8,
                                child: VideoPlayer(vController),
                              ),
                            ),
                          ),
              ],
            ),
          );
  }
}
