import 'package:flutter/material.dart';
import 'package:library_companion/book.dart';
import 'package:library_companion/book_list_widget.dart';
import 'package:library_companion/book_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Companion',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(title: 'Library Companion'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const itemNum = 10;
    final List<Book> books = List.generate(
        itemNum,
        (index) => Book(
            "Poirot's Early Cases",
            "Agatha Christie",
            "https://upload.wikimedia.org/wikipedia/en/5/50/Poirot%27s_Early_Cases_First_Edition_Cover_1974.jpg"
        )
    );
    final List<BookWidget> bookWidgets = books
        .map((bookItem) => BookWidget(book: bookItem))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BookListWidget(bookWidgets: bookWidgets),
    );
  }
}
