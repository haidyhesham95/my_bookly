import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/book_model.dart';
import '../repos/home_repo.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.homeRepo) : super(BooksInitial());



  final HomeRepo homeRepo;

  Future<void> fetchBooks(String category, String query) async {
    emit(BooksLoading());
    var result = await homeRepo.fetchBooks(category);
    result.fold(
          (failure) => emit(BooksFailure(failure.message)),
          (books) {
        final filteredBooks = books.where((book) {
          final title = book.volumeInfo!.title!.toLowerCase();
          return title.contains(query.toLowerCase());
        }).toList();

        emit(BooksSuccess(filteredBooks));
      },
    );
  }
}

