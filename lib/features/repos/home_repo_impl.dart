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
  Future<Either<Failure, List<BookModel>>> fetchBooks(String category) async {
    try {
      var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=$category');
      List<BookModel> books = [];
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
