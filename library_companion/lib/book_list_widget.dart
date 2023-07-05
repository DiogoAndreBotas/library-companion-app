import 'package:flutter/material.dart';
import 'package:library_companion/book_api_service.dart';
import 'book.dart';
import 'book_widget.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = BookApiService.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: futureBooks,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildBookList(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future refreshBooks() async {
    setState(() {
      futureBooks = BookApiService.getBooks();
    });
  }

  Widget _buildBookList(List<Book> books) {
    var bookWidgets = books.map((book) => BookWidget(book: book)).toList();

    return RefreshIndicator(
        onRefresh: refreshBooks,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 2.5),
          itemCount: bookWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 0 : 5, bottom: index == bookWidgets.length - 1 ? 0.0 : 8.0),
              child: bookWidgets[index],
            );
          },
        )
    );
  }
}