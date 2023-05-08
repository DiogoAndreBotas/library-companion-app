import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            HomeButton(text: 'Book List', verticalPadding: 10, horizontalPadding: 65),
            SizedBox(height: 50),
            HomeButton(text: 'Add a Book', verticalPadding: 10, horizontalPadding: 52),
            SizedBox(height: 50),
            HomeButton(text: 'I Feel Lucky', verticalPadding: 10, horizontalPadding: 50),
            SizedBox(height: 50),
            HomeButton(text: 'Suggest a Book', verticalPadding: 10, horizontalPadding: 27),
          ],
        ),
      ),
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
