import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repos/home_repo.dart';
import '../../model/book_model.dart';

part 'sport_book_state.dart';

class SportBookCubit extends Cubit<SportBookState> {
  SportBookCubit(this.homeRepo) : super(SportInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSportBooks( String query) async {
    emit(SportBooksLoading());
    var result = await homeRepo.fetchSportBooks(query);
    result.fold(
          (failure) => emit(SportBooksFailure(failure.message)),
          (books) {
            final filteredBooks = books.where((book) {
              final title = book.volumeInfo!.title!.toLowerCase();
              return title.contains(query.toLowerCase());
            }).toList();
        emit(SportBooksSuccess(filteredBooks));
      },
    );
  }
}
