import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/application/cubits/get_address/get_address_cubit.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/constants/strings.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets/address_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_appbar.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_elevated_button.dart';
import 'package:nibbles_ecommerce/presentation/widgets/tickers.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  void initState() {
    context
        .read<GetAddressCubit>()
        .getAddresses(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: Space.all(1.3, .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My addresses".toUpperCase(),
              style: AppText.h2b,
            ),
            Space.yf(1.2),
            BlocBuilder<GetAddressCubit, GetAddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  return state.addresses.isNotEmpty
                      ? SizedBox(
                          height: AppDimensions.normalize(220),
                          child: ListView.separated(
                            itemCount: state.addresses.length,
                            itemBuilder: (context, index) {
                              return addressItem(state.addresses[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Space.yf(1.6);
                            },
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: AppDimensions.normalize(70)),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.angryFace,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.antiqueRuby, BlendMode.srcIn),
                                ),
                                Space.yf(),
                                Text(
                                  "No Addresses added yet",
                                  style: AppText.h1
                                      ?.copyWith(color: AppColors.antiqueRuby),
                                ),
                              ],
                            ),
                          ),
                        );
                } else {
                  return Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: AppDimensions.normalize(80)),
                      child: const LoadingTicker(
                        text: AppStrings.loading,
                      ),
                    ),
                  );
                }
              },
            ),
            const Expanded(child: SizedBox()),
            customElevatedButton(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.addAddress);
                },
                text: "Add new Address".toUpperCase(),
                heightFraction: 20,
                width: double.infinity,
                color: AppColors.commonAmber),
            Space.yf(.4)
          ],
        ),
      ),
    );
  }
}
