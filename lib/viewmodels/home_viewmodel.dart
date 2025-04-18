// viewmodels/home_viewmodel.dart
import 'package:ravekb/models/section.dart';
import 'package:ravekb/models/sections/video_section.dart';
import 'package:ravekb/models/sections/article_section.dart';
import 'package:ravekb/models/sections/image_section.dart';
import 'package:ravekb/services/video_service.dart';

class HomeViewModel {
  final VideoService videoService;
  final List<Section> sections;

  HomeViewModel(this.videoService)
    : sections = [
        VideoSection(videoPath: 'assets/videos/background.mp4'),
        ArticleSection(
          title: 'Как работать с Flutter',
          description: 'Полное руководство по MVVM в Flutter',
        ),
        ImageSection(
          imagePath: 'assets/images/demo.jpg',
          caption: 'Пример изображения',
        ),
      ];

  Future<void> initVideo() async {
    await videoService.init(
      (sections.firstWhere((s) => s is VideoSection) as VideoSection).videoPath,
    );
    sections[0] = VideoSection(
      videoPath: 'assets/videos/background.mp4',
      controller: videoService.controller,
    );
  }

  void dispose() {
    videoService.dispose();
  }
}
