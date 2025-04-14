import 'package:ravekb/constants/app_strings.dart';
import 'package:video_player/video_player.dart';

class VideoService {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  Future<void> init(String videoPath) async {
    _controller =
        VideoPlayerController.asset(videoPath)
          ..setLooping(true)
          ..setVolume(0);

    try {
      await _controller.initialize();
      _isInitialized = true;
      _controller.play();
    } catch (e) {
      _isInitialized = false;
      throw Exception("${AppStrings.videoInitErr} $e");
    }
  }

  VideoPlayerController get controller => _controller;
  bool get isInitialized => _isInitialized;

  void dispose() {
    _controller.dispose();
  }
}
