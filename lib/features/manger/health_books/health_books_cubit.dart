import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repos/home_repo.dart';
import '../../model/book_model.dart';

part 'health_books_state.dart';

class HealthBooksCubit extends Cubit<HealthBooksState> {
  HealthBooksCubit(this.homeRepo) : super(HealthBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchHealthBooks(String query) async {
    emit(HealthBooksLoading());
    var result = await homeRepo.fetchHealthBooks(query);
    result.fold(
          (failure) => emit(HealthBooksFailure(failure.message)),
          (books) {
            final filteredBooks = books.where((book) {
              final title = book.volumeInfo!.title!.toLowerCase();
              return title.contains(query.toLowerCase());
            }).toList();
        emit(HealthBooksSuccess(filteredBooks));
      },
    );
  }
}
