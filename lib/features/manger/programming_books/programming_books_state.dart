part of 'programming_books_cubit.dart';

@immutable
sealed class ProgrammingBooksState {}

final class ProgrammingBooksInitial extends ProgrammingBooksState {}

final class ProgrammingBooksLoading extends ProgrammingBooksState {}

final class ProgrammingBooksSuccess extends ProgrammingBooksState {
  final List<BookModel> books;

  ProgrammingBooksSuccess(this.books);
}

final class ProgrammingBooksFailure extends ProgrammingBooksState {
  final String message;

  ProgrammingBooksFailure(this.message);
}
