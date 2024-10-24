import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoLoopNetwork extends StatefulWidget {
  const VideoLoopNetwork({super.key, required this.path, this.autoplay = true});

  final bool autoplay;
  final String path;

  @override
  State<VideoLoopNetwork> createState() => _VideoLoopNetworkState();
}

class _VideoLoopNetworkState extends State<VideoLoopNetwork> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.path,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        if (widget.autoplay) {
          _controller.play();
        }
        _controller.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        child: _controller.value.isInitialized
            ? SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              )
            : const RepaintBoundary(
                child: CircularProgressIndicator.adaptive(),
              ),
      ),
    );
  }
}
