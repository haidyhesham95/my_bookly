import 'package:bookly_app/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../errors/failure.dart';
import '../model/book_model.dart';
import 'home_repo.dart';


class HomeRepoImpl implements HomeRepo {
   final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFoodBooks(String query) async {
    //mediaType:book
    try {
     var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=food');
     List <BookModel>books = [];
     for (var item in data['items']) {
       books.add(BookModel.fromJson(item));
     }
     return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchHealthBooks(String query) async {
    try {
     var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=health &maxResults=10&printType=books');
     List <BookModel>books = [];
     for (var item in data['items']) {
       books.add(BookModel.fromJson(item));
     }
     return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<BookModel>>> fetchSportBooks(String query) async {
    try {
     var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=sport');
     List <BookModel>books = [];
     for (var item in data['items']) {
       books.add(BookModel.fromJson(item));
     }
     return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>>
      fetchProgrammingBooks(String query) async {
    try {
     var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=programming ');
     List <BookModel>books = [];
     for (var item in data['items']) {
       books.add(BookModel.fromJson(item));
     }
     return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchGraphicBooks(String query ) async {
    try {
     var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=graphic');
     List <BookModel>books = [];
     for (var item in data['items']) {
       books.add(BookModel.fromJson(item));
     }
     return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
