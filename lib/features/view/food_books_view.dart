
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/styles/colors.dart';
import '../functions/setup_service_locator.dart';
import '../manger/food_books/food_books_cubit.dart';
import '../repos/home_repo_impl.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_text_field.dart';

class FoodBooksView extends StatelessWidget {
  const FoodBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: customAppBar(context, title: 'Food Books'),
        body: BlocProvider(
          create: (context) {
            return FoodBooksCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchFoodBooks('food');
          },
          child: BlocBuilder<FoodBooksCubit, FoodBooksState>(
            builder: (context, state) {
              if (state is FoodBooksLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.dark,),
                );
              } else if (state is FoodBooksFailure) {
                return const Center(
                  child: Text('Failed to load books'),
                );
              } else if (state is FoodBooksSuccess) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: searchController,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          BlocProvider.of<FoodBooksCubit>(context).fetchFoodBooks(value);
                        }
                      },
                      onPressed: () {
                        final query = searchController.text.trim();
                        if (query.isNotEmpty) {
                          BlocProvider.of<FoodBooksCubit>(context).fetchFoodBooks(query);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(child: CustomListView(state: state)),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
