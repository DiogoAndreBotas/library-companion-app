import 'package:flutter/material.dart';
import 'package:library_companion/book_item.dart';
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
    final itemNum = 10;
    final List<BookItem> books = List.generate(
        itemNum,
        (index) => BookItem(
            "Poirot's Early Cases",
            "Agatha Christie",
            "https://upload.wikimedia.org/wikipedia/en/5/50/Poirot%27s_Early_Cases_First_Edition_Cover_1974.jpg"
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: itemNum,
        itemBuilder: (context, index) {
          return BookWidget(bookItem: books[index]);
        },
      )
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.text,
    required this.verticalPadding,
    required this.horizontalPadding
  });

  final String text;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 25),
        side: const BorderSide(width: 2, color: Colors.brown),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding
        ),
        foregroundColor: Colors.black
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
