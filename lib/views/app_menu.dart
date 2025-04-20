import 'package:flutter/material.dart';
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
        // Основной контейнер с выравниванием по центру
        child: SingleChildScrollView(
          // Добавляем возможность прокрутки если пунктов много
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min, // Важно для центрирования
            children: [
              const SizedBox(width: 20), // Отступ слева
              for (final item in viewModel.menuItems)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                    onPressed: () => viewModel.scrollToSection(item.sectionId),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text(item.title),
                  ),
                ),
              const SizedBox(width: 20), // Отступ справа
            ],
          ),
        ),
      ),
    );
  }
}
