import 'dart:convert';

import 'package:http/http.dart';

class HttpRequests {
  Future<dynamic> getBook(String input) async {
    var _endPoint = "https://www.googleapis.com/books/v1/volumes?q=${input}";
    try {
      var _response = await get(Uri.parse(_endPoint));
      if (_response.statusCode == 200) {
        var _content = jsonDecode(_response.body);
        //print(_content);
        return _content;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
