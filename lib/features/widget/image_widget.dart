import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../model/book_model.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key,required this.bookModel, required this.size});

  final BookModel bookModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: size.height * .4,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: CachedNetworkImage(imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? 'default_image_url',
          fit: BoxFit.fill,
          placeholder: (context, url) => Image.asset(Assets.imagesLoading,fit: BoxFit.fill,),

          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );

  }
}
