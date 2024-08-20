

import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../model/book_model.dart';


abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFoodBooks(String query);
  Future<Either<Failure, List<BookModel>>> fetchHealthBooks(String query);
  Future<Either<Failure, List<BookModel>>> fetchSportBooks(String query);
  Future<Either<Failure, List<BookModel>>> fetchProgrammingBooks(String query);
  Future<Either<Failure, List<BookModel>>> fetchGraphicBooks(String query);

// Future<Either<Failure, List<BookModel>>> fetchTechnologyBooks();

}
