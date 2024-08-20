part of 'health_books_cubit.dart';

@immutable
sealed class HealthBooksState {}

final class HealthBooksInitial extends HealthBooksState {}

final class HealthBooksLoading extends HealthBooksState {}

final class HealthBooksSuccess extends HealthBooksState {
  final List<BookModel> books;

  HealthBooksSuccess(this.books);
}

final class HealthBooksFailure extends HealthBooksState {
  final String message;

  HealthBooksFailure(this.message);
}
