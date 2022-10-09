import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:book_finder/Repository/http_requests.dart';
import 'package:equatable/equatable.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  List<dynamic> books = [];

  BookBloc() : super(BookInitial()) {
    on<BookSearchEvent>(_searchBook);
  }

  FutureOr<void> _searchBook(BookSearchEvent event, Emitter emit) async {
    emit(BookSearchState());
    final HttpRequests req = new HttpRequests();
    dynamic body = await req.getBook(event.titleSearch);
    if (body["totalItems"] == 0 || body == null) {
      emit(BookNotFoundState(errorMsg: "No se encontró el libro"));
    } else {
      books = List.of(body["items"]);
      emit(BookFoundState());
    }
  }
}
