import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/book_model.dart';
import '../../repos/home_repo.dart';

part 'graphic_books_state.dart';

class GraphicBooksCubit extends Cubit<GraphicBooksState> {
  GraphicBooksCubit( this.homeRepo) : super(GraphicBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchGraphicBooks(String query) async {
    emit(GraphicBooksLoading());
    var result = await homeRepo.fetchGraphicBooks(query);
    result.fold(
          (failure) => emit(GraphicBooksFailure(failure.message)),
          (books) {
            final filteredBooks = books.where((book) {
              final title = book.volumeInfo!.title!.toLowerCase();
              return title.contains(query.toLowerCase());
            }).toList();
        emit(GraphicBooksSuccess(filteredBooks));
      },
    );
  }
}
