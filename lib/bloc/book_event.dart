part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookSearchEvent extends BookEvent {
  final String titleSearch;

  BookSearchEvent({required this.titleSearch});
}
