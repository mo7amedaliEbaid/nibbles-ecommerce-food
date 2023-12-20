import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/cubits/nibbles_info/nibbles_info_cubit.dart';
import 'package:nibbles_ecommerce/core/constants/strings.dart';
import 'package:nibbles_ecommerce/presentation/widgets/tickers.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/models/info.dart';
import 'package:nibbles_ecommerce/presentation/widgets/common_border_radius.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    context.read<NibblesInfoCubit>().fetchAboutInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NibblesInfoCubit, NibblesInfoState>(
        listener: (context, state) {
          context.read<NibblesInfoCubit>().fetchAboutInfo();
        },
        builder: (context, state) {
          if (state is NibblesInfoLoaded) {
            return AboutBody(
              nibblesInfo: state.info,
              title: "About",
            );
          } else {
            return const Center(
              child: LoadingTicker(
                text: AppStrings.loading,
              ),
            );
          }
        },
      ),
    );
  }
}

class AboutBody extends StatelessWidget {
  const AboutBody({
    super.key,
    required this.nibblesInfo,
    required this.title,
  });

  final NibblesInfo nibblesInfo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        curvedlRecSvg(AppColors.deepTeal),
        positionedRow(context),
        positionedTitle(title.toUpperCase()),
        Positioned(
            top: AppDimensions.normalize(62),
            left: AppDimensions.normalize(9),
            right: AppDimensions.normalize(9),
            child: Material(
              borderRadius: maxBorderRadius,
              elevation: 2,
              child: Container(
                height: AppDimensions.normalize(250),
                padding: Space.hf(1.2),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: maxBorderRadius,
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Space.yf(1.5),
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
            ))
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
