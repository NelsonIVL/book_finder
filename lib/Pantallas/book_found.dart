import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BookFound extends StatelessWidget {
  final Map bookContent;
  const BookFound({super.key, required this.bookContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del libro"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.public)),
          IconButton(
              onPressed: () async {
                await Share.share(
                    "${bookContent["title"]}" +
                        "\nPaginas: ${bookContent["pageCount"]}",
                    subject: "hola supongo");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 300,
                  width: 220,
                  child: _displayImage(bookContent),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Flexible(
                        child: Text(
                          "${bookContent["title"]}",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${bookContent["publishedDate"]}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        _displayPageCount(),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: 300,
                            child: Flexible(
                              child: _displayDescription(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Text _displayPageCount() {
    if (bookContent["pageCount"] == null) {
      return Text("-");
    }
    return Text(
      "Paginas: ${bookContent["pageCount"]}",
      style: TextStyle(fontSize: 15),
    );
  }

  Text _displayDescription() {
    if (bookContent["description"] == null) {
      return Text("-");
    }
    return Text(
      "${bookContent["description"]}",
      style: TextStyle(fontSize: 15),
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 7,
    );
  }

  Widget _displayImage(Map media) {
    if (media["imageLinks"] == null) {
      return Image.asset(
        "assets/book-asset.png",
        fit: BoxFit.fill,
      );
    }
    return Image.network(
      "${media["imageLinks"]["thumbnail"]}",
      fit: BoxFit.fill,
    );
  }
}
