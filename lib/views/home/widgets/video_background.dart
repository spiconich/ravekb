import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoBackground({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        final videoRatio = controller.value.aspectRatio;
        final videoWidth = screenHeight * videoRatio;

        return SizedBox(
          height: screenHeight,
          width: videoWidth > screenWidth ? videoWidth : screenWidth,
          child: FittedBox(
            fit: videoWidth > screenWidth ? BoxFit.fitHeight : BoxFit.fitWidth,
            child: SizedBox(
              width: videoWidth,
              height: screenHeight,
              child: VideoPlayer(controller),
            ),
          ),
        );
      },
    );
  }
}
