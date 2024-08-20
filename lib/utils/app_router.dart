import 'package:bookly_app/features/view/food_books_view.dart';
import 'package:bookly_app/features/view/home_view.dart';
import 'package:go_router/go_router.dart';

import '../features/view/graphic_books_view.dart';
import '../features/view/health_books_view.dart';
import '../features/view/programming_books_view.dart';
import '../features/view/splash_view.dart';
import '../features/view/sport_book_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static const kFoodBooksView = '/foodBooksView';
  static const kHealthBooksView = '/healthBooksView';

  static const kSportBooksView = '/sportBooksView';

  static const kProgrammingBooksView = '/programmingBooksView';
  static const kGraphicBooksView = '/graphicBooksView';

  static final router = GoRouter(

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kFoodBooksView,
        builder: (context, state) => const FoodBooksView(),
      ),

      GoRoute(
        path: kHealthBooksView,
        builder: (context, state) => const HealthBooksView(),
      ),

      GoRoute(
        path: kSportBooksView,
        builder: (context, state) => const SportBookView(),
      ),
      GoRoute(
        path: kProgrammingBooksView,
        builder: (context, state) => const ProgrammingBooksView(),
      ),


      GoRoute(
        path: kGraphicBooksView,
        builder: (context, state) => const GraphicBooksView(),
      ),




      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),

    ],
  );
}