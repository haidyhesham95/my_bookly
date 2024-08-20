import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/styles/colors.dart';
import '../functions/setup_service_locator.dart';
import '../manger/programming_books/programming_books_cubit.dart';
import '../repos/home_repo_impl.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_text_field.dart';

class ProgrammingBooksView extends StatelessWidget {
  const ProgrammingBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(context, title: 'Programming Books'),
        body: BlocProvider(
          create: (context) {
            return ProgrammingBooksCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchProgrammingBooks('programming');
          },
          child: BlocConsumer<ProgrammingBooksCubit, ProgrammingBooksState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProgrammingBooksLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.dark,),
                );
              } else if (state is ProgrammingBooksFailure) {
                return const Center(
                  child: Text('Failed to load books'),
                );
              } else if (state is ProgrammingBooksSuccess) {
                return  Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: searchController,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          BlocProvider.of<ProgrammingBooksCubit>(context).fetchProgrammingBooks(value);
                        }
                      },
                      onPressed: () {
                        final query = searchController.text.trim();
                        if (query.isNotEmpty) {
                          BlocProvider.of<ProgrammingBooksCubit>(context).fetchProgrammingBooks(query);
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
