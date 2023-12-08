import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meals_vertical_listview.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              AppAssets.curvedRec,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(13),
            left: AppDimensions.normalize(4.5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Space.xf(5),
                SvgPicture.asset(
                  AppAssets.nibblesLogo,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ],
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(43),
            left: AppDimensions.normalize(10),
            child: Text(
              "SEARCH",
              style: AppText.h2b?.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(67),
            left: AppDimensions.normalize(2),
            child: Padding(
              padding: Space.hf(),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(
                  AppDimensions.normalize(7),
                ),
                child: Container(
                  height: AppDimensions.normalize(22),
                  width: AppDimensions.normalize(130),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.normalize(7),
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _searchController,
                      onSaved: (value) {
                        /* context.read<MealsBloc>().add(SearchMeals(
                            mealName:
                                _searchController.text.trim().toLowerCase()));*/

                        context.read<MealsBloc>().add(SearchAllMeals(
                            mealName:
                                _searchController.text.trim().toLowerCase()));
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Search Here",
                        labelStyle:
                            AppText.b2?.copyWith(color: AppColors.greyText),
                        prefixIcon: Padding(
                          padding: Space.all(.5, .8),
                          child: SvgPicture.asset(AppAssets.search),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: AppDimensions.normalize(350),
            margin: EdgeInsets.only(top: AppDimensions.normalize(100)),
            child: const MealsVerticalListview(),
          )
        ],
      ),
    );
  }
}
