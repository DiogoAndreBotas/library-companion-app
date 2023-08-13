class Book {
  final String title;
  final String authors;
  final int pages;
  final String isbn;
  final String imageUrl;

  const Book({
    required this.title,
    required this.authors,
    required this.pages,
    required this.isbn,
    required this.imageUrl
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['title'],
        authors: json['authors'].join(', '),
        pages: json['pages'],
        isbn: json['isbn'],
        imageUrl: 'http://192.168.1.96:8080/api/covers/${json['isbn']}'
    );
  }
}