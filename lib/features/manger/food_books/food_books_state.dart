part of 'food_books_cubit.dart';

@immutable
sealed class FoodBooksState {}

final class FoodBooksInitial extends FoodBooksState {}

final class FoodBooksLoading extends FoodBooksState {}

final class FoodBooksSuccess extends FoodBooksState {
  final List<BookModel> books;

  FoodBooksSuccess(this.books);
}

final class FoodBooksFailure extends FoodBooksState {
  final String message;

  FoodBooksFailure(this.message);
}
