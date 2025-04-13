import '../services/video_service.dart';

class HomeViewModel {
  final VideoService videoService;

  HomeViewModel(this.videoService);

  Future<void> initVideo() async {
    await videoService.init('assets/videos/background.mp4');
  }

  void dispose() {
    videoService.dispose();
  }
}
