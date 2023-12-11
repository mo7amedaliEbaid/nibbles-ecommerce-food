import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/application/cubits/search/search_cubit.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/loading_ticker.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meals_vertical_listview.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height/.8,
        child: Stack(
          children: [
            curvedlRecSvg(AppColors.deepTeal),
            positionedRow(context),
            positionedTitle("SEARCH"),
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
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          final searchQuery =
                              _searchController.text.trim().toLowerCase();
                          context.read<SearchCubit>().searchMeals(searchQuery);
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
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const LoadingTicker();
                  } else if (state is SearchSuccess) {
                    return Text(state.meals.first.name);
                  } else {
                    return const MealsVerticalListview();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
