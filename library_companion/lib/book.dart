class Book {
  final String title;
  final String author;
  final int pages;
  final String isbn;
  final String imageUrl;

  const Book({
    required this.title,
    required this.author,
    required this.pages,
    required this.isbn,
    required this.imageUrl
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        author: json['author'],
        pages: json['pages'],
        isbn: json['isbn'],
        imageUrl: json['imageUrl']
    );
  }
}