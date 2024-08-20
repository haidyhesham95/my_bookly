
import 'package:bookly_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_router.dart';
import '../../utils/styles/text.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    List<Item> items = [
      Item(
        image: Assets.imagesFood,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kFoodBooksView);
        },
      ),
      Item(
        image: Assets.imagesHealth,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kHealthBooksView);

        },
      ),
      Item(
        image: Assets.imagesSport,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kSportBooksView);
        },
      ),
      Item(
        image: Assets.imagesProgramming,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kProgrammingBooksView);
        },
      ),

      Item(
        image: Assets.imagesGraphic,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kGraphicBooksView);
        },
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Align(
                widthFactor: 1.5,
                child: Text(
                  'Library', style: AppStyles.styleRegular35(context),)),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
              thickness: 1,

            ),
            const SizedBox(height: 30,),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(right: 10, left: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    radius: 10,
                    onTap: () {
                      items[index].onTap!();
                    },

                    child: Card(
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: RepaintBoundary(child: Image.asset(items[index].image, fit: BoxFit.cover,))),
                    ),
                  );
                },

              ),
            ),
            const SizedBox(height: 15,),


          ],

        ),
      ),
    );
  }
}
  class Item {
    final void Function()? onTap ;
    final String image;

    Item({required this.image, required this.onTap,});
}

