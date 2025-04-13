import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';
import 'package:ravekb/services/video_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(VideoService());
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _viewModel.initVideo();
      if (mounted) setState(() {});
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка загрузки видео: $e')));
      }
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_viewModel.videoService.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    final videoRatio = _viewModel.videoService.controller.value.aspectRatio;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;

          return Stack(
            children: [
              // Адаптивное фоновое видео
              _videoBackground(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                videoRatio: videoRatio,
              ),
              // Полупрозрачный слой
              Container(color: Colors.black.withOpacity(0.3)),
              // Контент
              Center(
                child: Text(
                  "Ваш контент здесь",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned _videoBackground({
    required double screenHeight,
    required double screenWidth,
    required double videoRatio,
  }) {
    final videoWidth = screenHeight * videoRatio;
    return Positioned.fill(
      child: Center(
        child: SizedBox(
          height: screenHeight,
          width:
              videoWidth > screenWidth
                  ? screenHeight * videoRatio
                  : screenWidth,
          child: FittedBox(
            fit: videoWidth > screenWidth ? BoxFit.fitHeight : BoxFit.fitWidth,
            child: SizedBox(
              width: videoWidth,
              height: screenHeight,
              child: VideoPlayer(_viewModel.videoService.controller),
            ),
          ),
        ),
      ),
    );
  }
}
