import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/address.dart';

Widget addressItem(Address address) {
  return Container(
    height: AppDimensions.normalize(78),
    width: double.infinity,
    padding: Space.all(1, .7),
    decoration:
        BoxDecoration(color: Colors.white, borderRadius: profileBorderRadius),
    child: Padding(
      padding: EdgeInsets.only(left: AppDimensions.normalize(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.yf(.85),
          Text(
            address.title.capitalize(),
            style: AppText.h2,
          ),
          Space.yf(.4),
          Text(
            "${address.area}-${address.bloc}-${address.street}-${address.house}",
            style: AppText.h3?.copyWith(color: AppColors.greyText),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Space.yf(.1),
          Text(
            address.instructions,
            style: AppText.h3?.copyWith(color: AppColors.greyText),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Space.yf(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              customElevatedButton(
                  onTap: () {},
                  text: "Edit",
                  heightFraction: 17,
                  width: AppDimensions.normalize(32),
                  color: AppColors.antiqueRuby,
                  textColor: Colors.white),
              Space.xf(.7),
              customElevatedButton(
                onTap: () {},
                text: "Delete",
                heightFraction: 17,
                width: AppDimensions.normalize(32),
                color: AppColors.commonAmber,
              )
            ],
          )
        ],
      ),
    ),
  );
}
