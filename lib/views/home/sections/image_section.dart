import 'package:flutter/material.dart';
import 'package:ravekb/models/section.dart';

class ImageSection implements Section {
  // Изменили с ImageSectionModel на ImageSection
  @override
  final String type = 'image';
  final String imagePath;
  final String caption;
  final BoxFit fit;
  final Color backgroundColor;

  ImageSection({
    required this.imagePath,
    required this.caption,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(imagePath, fit: fit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              caption,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
