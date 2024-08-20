import 'package:flutter/material.dart';

import '../../utils/styles/colors.dart';
import '../../utils/styles/text.dart';
import '../model/book_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key,required this.bookModel, required this.size});
  final BookModel bookModel;
  final  Size size;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      heightFactor: 4.5,
      child: Container(
        padding: const EdgeInsets.only(left: 25),
        height: size.height * .2,
        width: size.width * .9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookModel.volumeInfo?.title ?? '',style: AppStyles.styleRegular23(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,),
              Row(
                children: [

                  Text('-  Author: ',style: AppStyles.styleRegular20(context).copyWith(color: AppColors.dark.withOpacity(0.6))),
                  const SizedBox(width: 5),
                  Flexible(child: Text(bookModel.volumeInfo?.authors![0] ?? 'author',style: AppStyles.styleRegular20(context).copyWith(color: AppColors.dark.withOpacity(0.6)),
                    overflow: TextOverflow.ellipsis,)),
                ],
              ),
              SizedBox(
                child: Row(

                  children: [
                    Text('-  Publisher: ',style: AppStyles.styleRegular20(context).copyWith(color: AppColors.dark.withOpacity(0.6),
                      overflow: TextOverflow.ellipsis,)),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(bookModel.volumeInfo?.publisher ?? 'publisher',style: AppStyles.styleRegular20(context).copyWith(color: AppColors.dark.withOpacity(0.6)),
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                  ],
                ),
              ),

            ]
        ),

      ),
    );
  }
}
