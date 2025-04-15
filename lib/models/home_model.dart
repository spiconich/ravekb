class Article {
  final String title;
  final String description;

  Article({required this.title, required this.description});
}

class HomeModel {
  final String backgroundVideoPath = 'assets/videos/background.mp4';
  final List<Article> _articles = [
    Article(
      title: 'Как работать с Flutter',
      description: 'Полное руководство по MVVM в Flutter',
    ),
    Article(
      title: 'State Management',
      description: 'Разбираем лучшие практики',
    ),
  ];

  List<Article> get articles => _articles;
}
