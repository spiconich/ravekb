import 'package:flutter/material.dart';
import 'package:ravekb/viewmodels/home_viewmodel.dart';
import 'package:ravekb/models/menu_item_model.dart';
import 'package:ravekb/views/app_menu/app_menu_item_factory.dart';

class AppMenu extends StatelessWidget {
  final HomeViewModel viewModel;

  const AppMenu({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
      child: Row(
        children: [
          // Текстовые пункты (скролл к секциям)
          for (final item in viewModel.menuItems.where(
            (i) => i.actionType == MenuItemActionType.scrollToSection,
          ))
            MenuItemFactory.create(item: item, viewModel: viewModel),

          const Spacer(),

          // Изображения (ссылки)
          for (final item in viewModel.menuItems.where(
            (i) => i.actionType == MenuItemActionType.openLink,
          ))
            MenuItemFactory.create(item: item, viewModel: viewModel),
        ],
      ),
    );
  }
}
