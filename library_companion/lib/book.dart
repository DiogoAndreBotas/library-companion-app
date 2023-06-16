class Book {
  final String name;
  final String author;
  final String imageUrl;

  const Book({
    required this.name,
    required this.author,
    required this.imageUrl
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        name: json['name'],
        author: json['author'],
        imageUrl: json['imageUrl']
    );
  }
}