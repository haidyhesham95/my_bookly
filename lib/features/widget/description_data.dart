import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../utils/styles/colors.dart';
import '../../utils/styles/text.dart';
import '../model/book_model.dart';

class DescriptionData extends StatelessWidget {
  const DescriptionData({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: ReadMoreText(
          bookModel.volumeInfo?.description ?? 'No description available',
          trimLines: 5,
          style: AppStyles.styleRegular22(context).copyWith(
            color: AppColors.dark.withOpacity(0.8),
          ),
          colorClickableText: AppColors.dark,
          trimMode: TrimMode.Line,
          trimCollapsedText: '...Read more',
          trimExpandedText: ' Read less',
          moreStyle: AppStyles.styleRegular18(context).copyWith(
            color: AppColors.dark.withOpacity(0.6),
          ),
          lessStyle: AppStyles.styleRegular18(context).copyWith(
            color: AppColors.dark.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

