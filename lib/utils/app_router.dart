import 'package:bookly_app/features/view/home_view.dart';
import 'package:go_router/go_router.dart';
import '../features/view/splash_view.dart';

abstract class AppRouter{

  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static const kBooksView = '/booksView';

  static final router = GoRouter(

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),

    ],
  );
}