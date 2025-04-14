import 'package:flutter/material.dart';
import 'package:ravekb/views/home/widgets/video_background.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          // 1. Адаптивное фоновое видео
          _buildVideoBackground(),
        ],
      ),
    );
  }

  Widget _buildVideoBackground() {
    return Positioned.fill(
      child: VideoBackground(controller: _viewModel.videoService.controller),
    );
  }
}
