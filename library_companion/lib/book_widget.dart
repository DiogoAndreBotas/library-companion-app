import 'package:flutter/material.dart';
import 'package:library_companion/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;

  const BookWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
            children: [
              SizedBox(
                height: 175,
                child: Image.network(book.imageUrl),
              )
            ]
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              book.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "by ${book.author}",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomLeft,
              child:
                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Status: Read',
                    style: TextStyle(
                      color: Colors.white, // Set text color
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            )
          ],
        )
      ],
    );
  }
}