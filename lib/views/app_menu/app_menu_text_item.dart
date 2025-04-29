import 'package:flutter/material.dart';
import 'package:ravekb/constants/dementions.dart';
import 'package:ravekb/models/menu_item_model.dart';

class TextMenuItem extends StatefulWidget {
  final MenuItemData item;
  final VoidCallback onPressed;

  const TextMenuItem({super.key, required this.item, required this.onPressed});

  @override
  State<TextMenuItem> createState() => _TextMenuItemState();
}

class _TextMenuItemState extends State<TextMenuItem> {
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
            child: Text(widget.item.title!),
          ),
        ),
      ),
    );
  }
}
