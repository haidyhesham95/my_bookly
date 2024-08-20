import 'package:bookly_app/utils/styles/text.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, { required String title}) {
  return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title:  Text(title),
    titleTextStyle: AppStyles.styleRegular22(context),

  );
}