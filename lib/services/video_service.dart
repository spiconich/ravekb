import 'package:video_player/video_player.dart';

class VideoService {
  VideoPlayerController? _controller;
  bool _isDisposed = false;

  Future<void> init(String videoPath) async {
    if (_isDisposed) return;

    await _controller?.dispose();

    _controller =
        VideoPlayerController.asset(videoPath)
          ..setLooping(true)
          ..setVolume(0);

    try {
      await _controller!.initialize();
      if (!_isDisposed) {
        await _controller!.play();
      }
    } catch (e) {
      await _controller?.dispose();
      _controller = null;
      rethrow;
    }
  }

  VideoPlayerController? get controller => _isDisposed ? null : _controller;

  void dispose() {
    _isDisposed = true;
    _controller?.dispose();
    _controller = null;
  }
}
