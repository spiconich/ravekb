import 'package:flutter/material.dart';
import 'package:ravekb/models/section.dart';

class ImageSection implements Section {
  @override
  final String type = 'image';
  final String imagePath;
  final String caption;
  final Color backgroundColor;

  ImageSection({
    required this.imagePath,
    required this.caption,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text("Img here"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(caption, style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
    );
  }
}
