import 'package:flutter/material.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';
import 'package:ravekb/views/app_menu/app_menu_item.dart';

class AppMenu extends StatelessWidget {
  final HomeViewModel viewModel;

  const AppMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10),
        ],
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final item in viewModel.menuItems)
                MenuItem(
                  title: item.title,
                  onPressed: () => viewModel.scrollToSection(item.sectionId),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
