import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> introItems =
      List.generate(4, (index) => AppAssets.introPng);

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Column(
        children: [
          Space.yf(2),
          Padding(
            padding: EdgeInsets.only(left: AppDimensions.normalize(8)),
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  padEnds: false,
                  height: AppDimensions.normalize(240),
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  reverse: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              items: introItems.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.normalize(10)),
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: 4,
            effect: CustomizableEffect(
              dotDecoration: DotDecoration(
                  height: AppDimensions.normalize(4),
                  width: AppDimensions.normalize(4),
                  color: AppColors.antiqueRuby.withOpacity(.2),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.normalize(1))),
              activeDotDecoration: DotDecoration(
                  height: AppDimensions.normalize(4),
                  width: AppDimensions.normalize(4),
                  color: AppColors.antiqueRuby,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.normalize(1))),
            ),
          ),
          Space.yf(3),
          Padding(
            padding: Space.hf(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return customElevatedButton(
                      onTap: () {
                        if (state.status == AuthStatus.unauthenticated) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRouter.signup,
                            (route) => false,
                          );
                        }

                        if (state.status == AuthStatus.authenticated) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRouter.root,
                            (route) => false,
                          );
                        }
                      },
                      text: "SKIP",
                      heightFraction: 21,
                      width: AppDimensions.normalize(50),
                      color: AppColors.antiqueRuby,
                      textColor: Colors.white,
                    );
                  },
                ),
                customElevatedButton(
                  onTap: () {
                    setState(() {
                      _carouselController.nextPage(
                          duration: const Duration(milliseconds: 500));
                    });
                  },
                  text: "NEXT",
                  heightFraction: 21,
                  width: AppDimensions.normalize(50),
                  color: AppColors.commonAmber,
                  //    textColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
