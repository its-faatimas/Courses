import 'package:amaliy_ish/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? videoPlayerController;

  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initChewie();
  }

  void _initChewie() {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(211),
              width: MediaQuery.of(context).size.width,
              child: Chewie(
                controller: chewieController!,
              ),
            ),
            SizedBox(
              height: 12,
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
Text(
              "Figmada mobile ilova dizayni",
              style: TextStyle(
                fontSize: (14),
                fontWeight: FontWeight.w700,
                color: Color(0xff0A191E),
              ),
            ),
            Text(
              "Figmada mobile ilova dizayni",
              style: TextStyle(
                fontSize: (14),
                fontWeight: FontWeight.w400,
                color: Color(0xff8F9698),
              ),
            )
            ],),)
            
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  Future init() async {
    await videoPlayerController!.initialize();
  }
}
