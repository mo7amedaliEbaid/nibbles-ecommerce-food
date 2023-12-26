import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/cubits/get_kids/get_kids_cubit.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/kid_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/nokid_column.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../widgets/kids_components.dart';

class SelectKidScreen extends StatefulWidget {
  const SelectKidScreen({super.key});

  @override
  State<SelectKidScreen> createState() => _SelectKidScreenState();
}

class _SelectKidScreenState extends State<SelectKidScreen> {
  @override
  void initState() {
    context
        .read<GetKidsCubit>()
        .getKids(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppDimensions.normalize(164),
            child: Stack(
              children: [
                curvedlRecSvg(AppColors.deepTeal),
                positionedRow(context),
                positionedTitle("Select KID".toUpperCase()),
                Positioned(
                  top: AppDimensions.normalize(62),
                  left: AppDimensions.normalize(10),
                  child: SizedBox(
                    height: AppDimensions.normalize(50),
                    child: Row(
                      children: [
                        addKidContainer(context),
                        Space.xf(1.2),
                        BlocBuilder<GetKidsCubit, GetKidsState>(
                            builder: (context, state) {
                          if (state is GetKidsLoaded && state.kids.isNotEmpty) {
                            log(state.kids.first.name);
                            return SizedBox(
                              width: AppDimensions.normalize(78),
                              child: ListView.separated(
                                itemCount: state.kids.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return kidItem(state.kids[index]);
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Space.xf(1.2);
                                },
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<GetKidsCubit, GetKidsState>(builder: (context, state) {
            if (state is GetKidsLoaded && state.kids.isNotEmpty) {
              return Padding(
                padding: Space.hf(1.3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose Address",
                          style: AppText.h2b,
                        ),
                        Row(
                          children: [
                            Container(
                              height: AppDimensions.normalize(9),
                              width: AppDimensions.normalize(9),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.deepTeal),
                              child: Center(
                                child: Icon(Icons.add,
                                    size: AppDimensions.normalize(5),
                                    color: Colors.white),
                              ),
                            ),
                            Space.xf(.3),
                            Text(
                              "Add New",
                              style: AppText.h3
                                  ?.copyWith(color: AppColors.deepTeal),
                            )
                          ],
                        )
                      ],
                    ),
                    DropdownButton(items: [], onChanged: null,)
                  ],
                ),
              );
            } else {
              return noKidColumn();
            }
          })
        ],
      ),
    );
  }
}
