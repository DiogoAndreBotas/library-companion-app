import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_companion/book.dart';

class BookApiService {
  static const apiUrl = 'http://192.168.1.96:8080';
  static const getBooksUrl = '$apiUrl/api/books';

  static Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse(getBooksUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((book) => Book.fromJson(book)).toList().cast<Book>();
    } else {
      throw Exception('Failed to load books');
    }
  }

  static void addBookWithIsbn(String isbn) async {
    await http.post(
        Uri.parse(getBooksUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'isbn': isbn})
    );
  }

}