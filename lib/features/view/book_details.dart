import 'package:bookly_app/features/widget/buttons_widget.dart';
import 'package:bookly_app/features/widget/card_widget.dart';
import 'package:bookly_app/features/widget/image_widget.dart';
import 'package:bookly_app/utils/styles/text.dart';
import 'package:flutter/material.dart';
import '../../utils/styles/colors.dart';
import '../model/book_model.dart';
import '../widget/custom_app_bar.dart';
import '../widget/description_data.dart';


class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: customAppBar(context, title: bookModel.volumeInfo?.title ?? 'Book Details'),
      body:
         SingleChildScrollView (
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ImageWidget(bookModel: bookModel, size: size),
                    SizedBox(
                      height: size.height * .14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Description:',style: AppStyles.styleRegular25(context),),
                          Text(bookModel.volumeInfo?.publishedDate ?? '2-2-2022',style: AppStyles.styleRegular22(context).copyWith(color: AppColors.dark.withOpacity(0.6)),),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    DescriptionData(bookModel: bookModel),
                    const SizedBox(
                      height: 50,
                    ),
                  ButtonsWidget(bookModel: bookModel, size: size),
                  ],
                ),
                CardWidget(bookModel: bookModel, size: size)
              ],
            ),
          ),
    );
  }
}
