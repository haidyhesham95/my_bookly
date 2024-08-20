import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/book_model.dart';
import '../../repos/home_repo.dart';

part 'food_books_state.dart';

class FoodBooksCubit extends Cubit<FoodBooksState> {
  FoodBooksCubit(this.homeRepo) : super(FoodBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFoodBooks( String query) async {
    emit(FoodBooksLoading());
    var result = await homeRepo.fetchFoodBooks( query);
    result.fold(
          (failure) => emit(FoodBooksFailure(failure.message)),
          (books) {
        final filteredBooks = books.where((book) {
          final title = book.volumeInfo!.title!.toLowerCase();
          return title.contains(query.toLowerCase());
        }).toList();

        emit(FoodBooksSuccess(filteredBooks));
      },
    );
  }
}
