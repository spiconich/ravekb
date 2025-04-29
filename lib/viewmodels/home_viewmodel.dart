import 'package:flutter/material.dart';
import 'package:ravekb/models/section_model.dart';
import 'package:ravekb/models/sections/video_section.dart';
import 'package:ravekb/models/sections/article_section.dart';
import 'package:ravekb/models/sections/image_section.dart';
import 'package:ravekb/models/menu_item_model.dart';
import 'package:ravekb/services/video_service.dart';
import 'package:ravekb/constants/global_keys.dart';

const String _homeVideoSectionId = "home_section";
const String _articleSectionId = "article_section";
const String _imageSectionId = 'gallery_section';

class HomeViewModel {
  final VideoService videoService;
  final List<Section> sections;
  final ScrollController scrollController = ScrollController();

  final List<MenuItemData> menuItems = const [
    MenuItemData(title: 'Home', sectionId: _homeVideoSectionId),
    MenuItemData(title: 'Раздел_1', sectionId: _articleSectionId),
    MenuItemData(title: 'Раздел_2', sectionId: _imageSectionId),
  ];

  HomeViewModel(this.videoService)
    : sections = [
        VideoSection(
          videoPath: 'assets/videos/background.mp4',
          id: _homeVideoSectionId,
        ),
        ArticleSection(
          id: _articleSectionId,
          title: 'Как работать с Flutter',
          description: 'Полное руководство по MVVM в Flutter',
        ),
        ImageSection(
          id: _imageSectionId,
          imagePath: 'assets/images/demo.jpg',
          caption: 'Пример изображения',
        ),
      ];

  void scrollToSection(String sectionId) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    final index = sections.indexWhere((s) => s.id == sectionId);
    if (index != -1) {
      final offset = index * MediaQuery.of(context).size.height;
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> initVideo() async {
    await videoService.init(
      (sections.firstWhere((s) => s is VideoSection) as VideoSection).videoPath,
    );
    sections[0] = VideoSection(
      id: _homeVideoSectionId,
      videoPath: 'assets/videos/background.mp4',
      controller: videoService.controller,
    );
  }

  void dispose() {
    videoService.dispose();
  }
}
