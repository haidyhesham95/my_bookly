import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/styles/colors.dart';
import '../functions/setup_service_locator.dart';
import '../manger/books_cubit.dart';
import '../repos/home_repo_impl.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_list_view.dart';
import '../widget/search_field.dart';

class BooksView extends StatelessWidget {
  final String category;
  final String query;

  const BooksView({super.key, required this.category, required this.query});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, title: '${category.capitalize()} Books'),
      body: BlocProvider(
        create: (context) {
          return BooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchBooks(query, '');
          },
        child: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: AppColors.dark));
            } else if (state is BooksFailure) {
              return Center(child: Text(state.message));
            } else if (state is BooksSuccess) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  SearchField(
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        BlocProvider.of<BooksCubit>(context)
                            .fetchBooks(query, value);
                      }
                    },
                    onPressed: () {
                      final queryText = searchController.text.trim();
                      if (queryText.isNotEmpty) {
                        BlocProvider.of<BooksCubit>(context)
                            .fetchBooks(query, queryText);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: CustomListView(state: state)),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
