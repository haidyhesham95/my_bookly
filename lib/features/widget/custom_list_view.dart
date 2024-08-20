import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../../utils/styles/colors.dart';
import '../../utils/styles/text.dart';
import '../view/book_details.dart';

class CustomListView extends StatelessWidget {
 const CustomListView({super.key, required this.state});

final dynamic  state;
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(bookModel: state.books[index]),
                ),
              );
            },
            child: SizedBox(
              height: 125,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail ?? Assets.imagesFood,
                        fit: BoxFit.cover,
                        placeholder: (buildContext, string) => Image.asset(Assets.imagesLoading, fit: BoxFit.cover,),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                          child: Text(
                            state.books[index].volumeInfo?.title ?? 'name',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.styleRegular23(context),

                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          state.books[index].volumeInfo?.authors![0] ?? 'author',
                          style: AppStyles.styleRegular18(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),

                        Align (
                            alignment: Alignment.topRight,
                            child: Text('${state.books[index].volumeInfo?.pageCount.toString() ?? '200'} pages',
                              style: AppStyles.styleRegular14(context),)),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Column(
            children:  [
              const SizedBox(
                height: 12,
              ),
              Divider(
                height: 1,
                color: AppColors.dark.withOpacity(0.5),
              ),
              const SizedBox(
                height: 12,
              ),
            ]

        );
      },
      itemCount: state.books.length,

    );
  }
}
