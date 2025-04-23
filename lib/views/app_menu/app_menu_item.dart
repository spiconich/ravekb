import 'package:flutter/material.dart';
import 'package:ravekb/constants/dementions.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const MenuItem({required this.title, required this.onPressed});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
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
