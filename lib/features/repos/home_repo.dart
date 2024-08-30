
import 'package:dartz/dartz.dart';
import '../errors/failure.dart';
import '../model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBooks(String category);
}