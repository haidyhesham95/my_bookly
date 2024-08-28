import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/styles/colors.dart';
import '../functions/setup_service_locator.dart';
import '../manger/sport/sport_book_cubit.dart';
import '../repos/home_repo_impl.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_text_field.dart';


class SportBookView extends StatelessWidget {
  const SportBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, title: 'Sport Books'),
      body: BlocProvider(
        create: (context) {
          return SportBookCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchSportBooks('sport');
        },
        child: BlocBuilder<SportBookCubit, SportBookState>(
          builder: (context, state) {
            if (state is SportBooksLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.dark,),
              );
            } else if (state is SportBooksFailure) {
              return const Center(
                child: Text('Failed to load books'),
              );
            } else if (state is SportBooksSuccess) {
              return  Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        BlocProvider.of<SportBookCubit>(context).fetchSportBooks(value);
                      }
                    },
                    onPressed: () {
                      final query = searchController.text.trim();
                      if (query.isNotEmpty) {
                        BlocProvider.of<SportBookCubit>(context).fetchSportBooks(query);
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

            return Container();
          }


        ),
      ),
    );
  }
}
