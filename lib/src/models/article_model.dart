class Article {
  final String title;
  final String byLine;
  final String url;
  final String imageUrl;
  final String publishedDate;
  final String summary;

  Article({
    this.title,
    this.byLine,
    this.url,
    this.imageUrl,
    this.publishedDate,
    this.summary,
  });

  Article.fromMap(Map<String, dynamic> data)
      : title = data['title'],
        byLine = data['byline'],
        url = data['url'],
        imageUrl = data['multimedia'].length > 0
            ? data['multimedia'][3]['url']
            : 'https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
        publishedDate = data['published_date'],
        summary = data['abstract'];
}
