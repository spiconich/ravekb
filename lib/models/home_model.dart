class Article {
  final String title;
  final String description;

  Article({required this.title, required this.description});
}

class HomeModel {
  final List<Article> articles;

  HomeModel({required this.articles});
}
