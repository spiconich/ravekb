import 'package:flutter/material.dart';
import 'package:ravekb/models/menu_item_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ravekb/views/app_menu/app_menu_text_item.dart';
import 'package:ravekb/views/app_menu/app_menu_image_item.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';

class MenuItemFactory {
  static Widget create({
    required MenuItemData item,
    required HomeViewModel viewModel,
  }) {
    switch (item.actionType) {
      case MenuItemActionType.scrollToSection:
        return TextMenuItem(
          item: item,
          onPressed: () => viewModel.scrollToSection(item.target),
        );
      case MenuItemActionType.openLink:
        return ImageMenuItem(
          item: item,
          onPressed: () => _launchUrl(item.target),
        );
    }
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
