import 'package:flutter/material.dart';
import 'package:library_companion/add_book_button.dart';
import 'package:library_companion/book_list_widget.dart';

void main() {
  runApp(const LibraryCompanionApp());
}

class LibraryCompanionApp extends StatelessWidget {
  const LibraryCompanionApp({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          AddBookButton()
        ],
      ),
      body: const BookListWidget(),
    );
  }
}
