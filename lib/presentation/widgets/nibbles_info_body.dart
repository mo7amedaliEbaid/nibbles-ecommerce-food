import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/models/info.dart';

class NibblesInfoBody extends StatelessWidget {
  const NibblesInfoBody({
    super.key,
    required this.nibblesInfo,
    required this.title,
  });

  final NibblesInfo nibblesInfo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: Space.hf(1.5),
          child: Text(
            title.toUpperCase(),
            style: AppText.h2b,
          ),
        ),
        Space.yf(1.5),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: Space.hf(2.5),
              child: Column(
                children: [
                  _buildVerseText(nibblesInfo.verse1),
                  Space.yf(),
                  _buildVerseText(nibblesInfo.verse2),
                  Space.yf(),
                  _buildVerseText(nibblesInfo.verse3),
                  Space.yf(),
                  _buildVerseText(nibblesInfo.verse4),
                  Space.yf(1.5),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildVerseText(String text) {
    return Text(
      text,
      style: AppText.b1?.copyWith(color: AppColors.greyText, height: 1.8),
    );
  }
}
