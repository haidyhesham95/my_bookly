
import 'package:bookly_app/utils/styles/size_config.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppStyles {
  static TextStyle styleRegular35(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 35),
      //fontFamily: 'Courgette',
      fontFamily: 'Cairo',
      color: AppColors.dark,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular23(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 23),

      fontFamily: 'Cairo',
      color: AppColors.dark,

      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle styleRegular25(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      color: AppColors.dark,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleRegular22(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      color: AppColors.dark,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleRegular20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      color: AppColors.dark,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }


  static TextStyle styleRegular18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      color: AppColors.dark,
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleRegular14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      color: AppColors.dark.withOpacity(0.7),
      fontFamily: 'Cairo',
      fontWeight: FontWeight.w500,
    );
  }

}


double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}