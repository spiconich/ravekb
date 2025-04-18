import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:ravekb/models/section.dart';

class VideoSection implements Section {
  @override
  final String type = 'video';
  final String videoPath;
  final VideoPlayerController? controller;

  VideoSection({required this.videoPath, this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator(color: Colors.red));
    }

    return VisibilityDetector(
      key: Key('video_section_$videoPath'),
      onVisibilityChanged: (info) {
        final isVisible = info.visibleFraction > 0;
        if (isVisible && !controller!.value.isPlaying) {
          controller!.play();
        } else if (!isVisible && controller!.value.isPlaying) {
          controller!.pause();
        }
      },
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: controller!.value.size.width,
            height: controller!.value.size.height,
            child: VideoPlayer(controller!),
          ),
        ),
      ),
    );
  }
}
