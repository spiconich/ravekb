import 'package:flutter/material.dart';
import 'package:ravekb/models/menu_item_model.dart';

class ImageMenuItem extends StatefulWidget {
  final MenuItemData item;
  final VoidCallback onPressed;

  const ImageMenuItem({super.key, required this.item, required this.onPressed});

  @override
  State<ImageMenuItem> createState() => _ImageMenuItemState();
}

class _ImageMenuItemState extends State<ImageMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Tooltip(
        message: _getTooltipMessage(), // Подсказка с URL
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(20),
          hoverColor: Colors.red.withOpacity(0.3),
          onHover: (hovered) => setState(() => _isHovered = hovered),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: _isHovered ? 1.2 : 1.0,
              child: Image.asset(
                widget.item.imagePath!,
                width: 24,
                height: 24,
                color: _isHovered ? Colors.red : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getTooltipMessage() {
    final uri = Uri.parse(widget.item.target);
    return '${uri.host}${uri.path}';
  }
}
