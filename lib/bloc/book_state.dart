part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookSearchState extends BookState {}

class BookFoundState extends BookState {}

class BookNotFoundState extends BookState {
  final String errorMsg;

  BookNotFoundState({required this.errorMsg});
  @override
  // TODO: implement props
  List<Object> get props => [errorMsg];
}
