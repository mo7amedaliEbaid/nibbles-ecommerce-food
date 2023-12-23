import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/cubits/kids_steps/kids_steps_cubit.dart';

import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/enums/enums.dart';
import 'package:nibbles_ecommerce/presentation/widgets/addKid_step1.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_appbar.dart';
import 'package:nibbles_ecommerce/presentation/widgets/kids_components.dart';

import '../widgets/addKid_step2.dart';

class AddKidScreen extends StatefulWidget {
  const AddKidScreen({super.key});

  @override
  State<AddKidScreen> createState() => _AddKidScreenState();
}

class _AddKidScreenState extends State<AddKidScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Space.all(1.2, .6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add KID Profile".toUpperCase(),
                    style: AppText.h2b,
                  ),
                  Space.yf(1.5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      stepStack(
                        stepImage: AppAssets.step1Png,
                        svgIcon: AppAssets.profile,
                      ),
                      Space.xf(),
                      BlocBuilder<KidsStepsCubit, KidsStepType>(
                        builder: (context, state) {
                          switch (state) {
                            case KidsStepType.index0:
                              return stepNumberTexts("1", "Personal Details");
                            case KidsStepType.index1:
                              return stepNumberTexts("2", "Diet Details");
                            case KidsStepType.index2:
                              return stepNumberTexts("3", "Food Details");
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            BlocBuilder<KidsStepsCubit, KidsStepType>(
              builder: (context, state) {
                switch (state) {
                  case KidsStepType.index0:
                    return const Step1();
                  case KidsStepType.index1:
                    return const Step2();
                  case KidsStepType.index2:
                    return const Step3();
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
