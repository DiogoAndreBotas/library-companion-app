import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_companion/book.dart';
import 'dart:io' show Platform;

import 'package:library_companion/platform_not_supported_exception.dart';

class BookApiService {
  static const host = '192.168.1.96';
  static const apiUrl = 'http://$host:8080';
  static final booksUrl = '$apiUrl/api/users/${_getUserId()}/books';

  static Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse(booksUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map((book) => Book.fromJson(book)).toList().cast<Book>();
    } else {
      throw Exception('Failed to load books');
    }
  }

  static Future<http.Response> addBook(String isbn) {
    return http.post(
        Uri.parse(booksUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'isbn': isbn})
    );
  }

  // TODO cache this value on startup
  static String _getUserId() {
    if (Platform.isIOS) {
      return '2';
    }
    else if (Platform.isAndroid) {
      return '1';
    }
    else {
      throw PlatformNotSupportedException('Platform ${Platform.operatingSystem} is not supported');
    }
  }
}