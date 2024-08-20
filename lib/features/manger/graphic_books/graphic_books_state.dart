part of 'graphic_books_cubit.dart';

@immutable
sealed class GraphicBooksState {}

final class GraphicBooksInitial extends GraphicBooksState {}

final class GraphicBooksLoading extends GraphicBooksState {}

final class GraphicBooksSuccess extends GraphicBooksState {
  final List<BookModel> books;

  GraphicBooksSuccess(this.books);
}

final class GraphicBooksFailure extends GraphicBooksState {
  final String message;

  GraphicBooksFailure(this.message);
}
