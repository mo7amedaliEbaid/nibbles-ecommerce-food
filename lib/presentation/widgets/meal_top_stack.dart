import 'package:flutter/material.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

Widget mealTopStack(BuildContext context){
  return Stack(
    children: [
      Image.asset(
        AppAssets.mealsByCat,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      Positioned(
        top: 0,
        child: Container(
          color: AppColors.transparentColor.withOpacity(.24),
          height: AppDimensions.normalize(19),
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.only(left: AppDimensions.normalize(5)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: AppDimensions.normalize(10),
                color: Colors.white,
              ),
            ),
          ),
        ),
      )
    ],
  );
}