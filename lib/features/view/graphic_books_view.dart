import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/styles/colors.dart';
import '../functions/setup_service_locator.dart';
import '../manger/graphic_books/graphic_books_cubit.dart';
import '../repos/home_repo_impl.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_list_view.dart';
import '../widget/custom_text_field.dart';

class GraphicBooksView extends StatelessWidget {
  const GraphicBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
  appBar: customAppBar(context, title: 'Graphic Books'),
        body: BlocProvider(
          create: (context) {
            return GraphicBooksCubit(
              getIt.get<HomeRepoImpl>(),
            )..fetchGraphicBooks('graphic');
          },
          child: BlocBuilder<GraphicBooksCubit, GraphicBooksState>(
            builder: (context, state) {
              if (state is GraphicBooksLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.dark,),
                );
              } else if (state is GraphicBooksFailure) {
                return const Center(
                  child: Text('Failed to load books'),
                );
              } else if (state is GraphicBooksSuccess) {
                return  Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: searchController,
                      onFieldSubmitted: (value) {
                        if (value.isNotEmpty) {
                          BlocProvider.of<GraphicBooksCubit>(context).fetchGraphicBooks(value);
                        }
                      },
                      onPressed: () {
                        final query = searchController.text.trim();
                        if (query.isNotEmpty) {
                          BlocProvider.of<GraphicBooksCubit>(context).fetchGraphicBooks(query);
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
        )

    );
  }
}
