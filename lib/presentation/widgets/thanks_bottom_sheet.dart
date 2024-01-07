import 'package:flutter/material.dart';
import '../../configs/configs.dart';
import '../../core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

Future<void> showThanksBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(10)),
    ),
    isDismissible: false,
    backgroundColor: Colors.white,
    constraints: BoxConstraints(
        minHeight: AppDimensions.normalize(115),
        maxHeight: AppDimensions.normalize(115),
        maxWidth: double.infinity),
    context: context,
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: Space.all(1, 1.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Thanks".toUpperCase(),
                style: AppText.h3b,
              ),
              Text(
                "Thanks for contact us.",
                style: AppText.h3,
              ),
              customElevatedButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "OK",
                  heightFraction: 20,
                  width: double.infinity,
                  color: AppColors.commonAmber)
            ],
          ),
        ),
      );
    },
  );
}
