import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repos/home_repo.dart';
import '../../model/book_model.dart';

part 'programming_books_state.dart';

class ProgrammingBooksCubit extends Cubit<ProgrammingBooksState> {
  ProgrammingBooksCubit(this.homeRepo) : super(ProgrammingBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchProgrammingBooks(String query) async {
    emit(ProgrammingBooksLoading());
    var result = await homeRepo.fetchProgrammingBooks(query);
    result.fold(
          (failure) => emit(ProgrammingBooksFailure(failure.message)),
          (books) {
            final filteredBooks = books.where((book) {
              final title = book.volumeInfo!.title!.toLowerCase();
              return title.contains(query.toLowerCase());
            }).toList();
        emit(ProgrammingBooksSuccess(filteredBooks));
      },
    );
  }

}
