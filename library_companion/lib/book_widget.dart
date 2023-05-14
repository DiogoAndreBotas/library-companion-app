import 'package:flutter/cupertino.dart';
import 'package:library_companion/book_item.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    super.key,
    required this.bookItem
  });

  final BookItem bookItem;

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        SizedBox(
          height: 250,
          child: Image.network(bookItem.imageUrl),
        ),
        Column(
          children: [
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Title: ${bookItem.name}"),
              ),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Author: ${bookItem.author}")
              ),
            ),
          ],
        )
      ],
    );
  }
}