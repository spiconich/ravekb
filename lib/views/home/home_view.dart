import 'package:flutter/material.dart';
import 'package:ravekb/views/home/widgets/video_background.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';
import 'package:ravekb/services/video_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();

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
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. Видео-секция (как обычный блок)
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: VideoBackground(
                controller: _viewModel.videoService.controller,
              ),
            ),
          ),

          // 2. Остальные секции
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildContentSection(index),
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(int index) {
    final colors = [
      Colors.blueGrey[800]!,
      Colors.blueGrey[600]!,
      Colors.blueGrey[400]!,
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      color: colors[index],
      alignment: Alignment.center,
      child: Text(
        'Секция ${index + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
