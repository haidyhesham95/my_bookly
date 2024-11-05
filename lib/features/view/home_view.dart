
import 'package:bookly_app/features/view/book_view.dart';
import 'package:bookly_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../utils/styles/text.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
      List<Item> items = [
        Item(
          category: 'food',
          image: Assets.imagesFood,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksView(query: 'kitchen', category: 'food'),
              ),
            );
          },
        ),
        Item(
          category: 'health',
          image: Assets.imagesHealth,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksView(query: 'health &maxResults=10&printType=books', category: 'health'),
              ),
            );
          },
        ),
        Item(
          category: 'sport',
          image: Assets.imagesSport,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksView(query: 'sport', category: 'sport'),
              ),
            );
          },
        ),
        Item(
          category: 'programming',
          image: Assets.imagesProgramming,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksView(category: 'programming', query: 'programming'),
              ),
            );
          },
        ),
        Item(
          category: 'graphic',
          image: Assets.imagesGraphic,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BooksView(query: 'graphic', category: 'graphic'),
              ),
            );
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
  final String category; // Add a category field
  final void Function()? onTap;
  final String image;

  Item({
    required this.category, // Update the constructor
    required this.image,
    required this.onTap,
  });
}

