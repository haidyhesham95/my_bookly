part of 'sport_book_cubit.dart';

@immutable
sealed class SportBookState {}

final class SportInitial extends SportBookState {}

final class SportBooksLoading extends SportBookState {}

final class SportBooksSuccess extends SportBookState {
  final List<BookModel> books;

  SportBooksSuccess(this.books);
}

final class SportBooksFailure extends SportBookState {
  final String message;

  SportBooksFailure(this.message);
}
