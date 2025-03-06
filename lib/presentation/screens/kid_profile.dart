import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/models/models.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'dart:math' as math;

import '../../core/core.dart';

class KidProfileScreen extends StatelessWidget {
  const KidProfileScreen({super.key, required this.kid});

  final Kid kid;

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: Space.hf(1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.y!,
              Text(
                "KID Profile".toUpperCase(),
                style: AppText.h2b,
              ),
              Space.y1!,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.kidsImages[random.nextInt(2)],
                  ),
                  Space.xf(),
                  Text(
                    kid.name.capitalize(),
                    style: AppText.h3,
                  ),
                  Space.xf(2),
                  editSvg(),
                  Space.xf(.5),
                  Image.asset(
                    AppAssets.removePng,
                    height: AppDimensions.normalize(18),
                  )
                ],
              ),
              Space.y2!,
              Text(
                "Personal Details",
                style: AppText.h2,
              ),
              Space.y!,
              Wrap(
                spacing: AppDimensions.normalize(4),
                runSpacing: AppDimensions.normalize(8),
                children: [
                  personalDetailsItem(
                      topText: 'Name', bottomText: kid.name.capitalize()),
                  personalDetailsItem(
                      topText: 'Gender', bottomText: kid.gender.capitalize()),
                  personalDetailsItem(
                      topText: 'Age', bottomText: "${kid.age} Years"),
                  personalDetailsItem(
                      topText: 'Height', bottomText: "${kid.height} CM"),
                  personalDetailsItem(
                      topText: 'Weight', bottomText: "${kid.weight} Kg"),
                ],
              ),
              Space.yf(2),
              Text(
                "Diet Details",
                style: AppText.h2,
              ),
              Space.yf(),
              Column(
                children: [
                  dietDetailsItem(
                      topText: "Diet Goal", bottomText: "Diet Goal"),
                  Space.yf(),
                  dietDetailsItem(
                      topText: "Goal Weight", bottomText: "Goal Weight"),
                  Space.yf(),
                  dietDetailsItem(
                      topText: "Health Problems",
                      bottomText:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                ],
              ),
              Space.yf(1.5),
              Text(
                "Food Details",
                style: AppText.h2,
              ),
              Space.yf(.7),
              foodDetailsItem(
                  topText: "Dislikes",
                  bottomTexts: ["Cilantro", "Dry Tomatoes"],
                  context: context),
              Space.yf(),
              foodDetailsItem(
                  topText: "Food allergies",
                  bottomTexts: ["Peanuts", "Wheat Allergy"],
                  context: context),
              Space.yf(1.7),
            ],
          ),
        ),
      ),
    );
  }
}
