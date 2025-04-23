import 'package:flutter/material.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';
import 'package:ravekb/services/video_service.dart';
import 'package:ravekb/views/app_menu/app_menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(VideoService());
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _viewModel.initVideo();
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка видео: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _viewModel.scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: _viewModel.sections[index].build(context),
                  ),
                  childCount: _viewModel.sections.length,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppMenu(viewModel: _viewModel),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
