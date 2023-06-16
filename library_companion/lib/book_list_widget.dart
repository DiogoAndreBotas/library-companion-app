import 'package:flutter/cupertino.dart';
import 'book_widget.dart';

class BookListWidget extends StatelessWidget {
  final List<BookWidget> bookWidgets;

  const BookListWidget({
    super.key,
    required this.bookWidgets
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 2.5),
      itemCount: bookWidgets.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 0 : 5, bottom: index == bookWidgets.length - 1 ? 0.0 : 8.0),
          child: bookWidgets[index],
        );
      },
    );
  }
}