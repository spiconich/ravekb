import 'package:flutter/material.dart';
import 'package:ravekb/constants/dementions.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';

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
                _MenuItem(
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

class _MenuItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const _MenuItem({required this.title, required this.onPressed});

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: appBarTextSize,
              color: _isHovered ? Colors.red : Colors.white,
              fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
