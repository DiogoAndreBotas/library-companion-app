import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart';
import 'package:library_companion/book_api_service.dart';

class AddBookButton extends StatelessWidget {
  const AddBookButton({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          String isbn = await FlutterBarcodeScanner.scanBarcode(
              "#ff6666", "Cancel", true, ScanMode.BARCODE
          );

          if (isbn == "-1") {
            return;
          }

          BookApiService
              .addBookWithIsbn(isbn)
              .then((response) => event.broadcast(ResponseArg(response)));
        },
        icon: const Icon(Icons.add)
    );
  }
}

class ResponseArg extends EventArgs {
  final Response _response;

  ResponseArg(this._response);

  Response getResponse() {
    return _response;
  }
}