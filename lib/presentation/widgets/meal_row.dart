import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';


Widget mealRow({required String leftText, required String rightText}){
return Column(
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText,style: AppText.h3?.copyWith(color: AppColors.greyText),),
        Text(rightText ,style:AppText.h3?.copyWith(color: AppColors.lightGrey),),
      ],
    ),
    Space.yf(.5),
    const Divider(color: AppColors.lightGrey,),
    Space.yf(.5),
  ],
);
}