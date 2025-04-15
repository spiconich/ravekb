import '../services/video_service.dart';
import '../models/home_model.dart';

class HomeViewModel {
  final VideoService videoService;
  HomeModel _model = HomeModel();

  HomeViewModel(this.videoService);

  Future<void> initVideo() async {
    await videoService.init(_model.backgroundVideoPath);
  }

  List<Article> get articles => _model.articles;

  void dispose() {
    videoService.dispose();
  }
}
