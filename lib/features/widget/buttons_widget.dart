import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/styles/colors.dart';
import '../../utils/styles/text.dart';
import '../model/book_model.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key,required this.bookModel, required this.size});
  final BookModel bookModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.only(top: size.height * .01,
        bottom: size.height * .05,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.dark.withOpacity(0.15),

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.favorite_border,color: AppColors.dark,size: 30,),
                ),
              ),

              SizedBox(
                width: size.width * .6,
                height: size.height * .06,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async{
                    Uri uri = Uri.parse(bookModel.volumeInfo?.previewLink ?? 'https://www.google.com');
                    if (await canLaunch(uri.toString())) {
                      await launchUrl(uri);
                    }


                  },
                  child:  Text('Reading',style: AppStyles.styleRegular25(context),),
                ),
              ),
            ],
          ),
        ),
      ),
    )
    ;
  }
}
