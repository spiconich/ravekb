enum MenuItemActionType {
  scrollToSection, // Для текстовых пунктов - скролл к секции
  openLink, // Для изображений - открытие ссылки
}

class MenuItemData {
  final String? title;
  final String? imagePath;
  final String target;
  final MenuItemActionType actionType;

  const MenuItemData.text({required this.title, required String sectionId})
    : imagePath = null,
      target = sectionId,
      actionType = MenuItemActionType.scrollToSection;

  const MenuItemData.image({required this.imagePath, required String url})
    : title = null,
      target = url,
      actionType = MenuItemActionType.openLink;
}
