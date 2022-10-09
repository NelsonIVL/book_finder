import 'package:book_finder/Pantallas/book_found.dart';
import 'package:flutter/material.dart';

class BookResults extends StatelessWidget {
  final Map<dynamic, dynamic> books;
  final int indice;

  const BookResults({super.key, required this.books, required this.indice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => BookFound(
                  bookContent: books["volumeInfo"],
                ))));
      },
      child: Container(
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
                height: 138,
                width: 120,
                child: _displayImage(books["volumeInfo"])),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Flexible(
                fit: FlexFit.tight,
                child: Text(
                  "${books["volumeInfo"]["title"]}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _displayImage(Map media) {
    if (media["imageLinks"] == null) {
      return Image.asset("assets/book-asset.png");
    }
    return FadeInImage.assetNetwork(
      placeholder: 'assets/book-asset.png',
      image: "${media["imageLinks"]["thumbnail"]}",
    );
  }
}
