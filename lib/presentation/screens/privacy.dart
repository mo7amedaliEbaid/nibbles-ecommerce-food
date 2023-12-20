import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_appbar.dart';
import 'package:nibbles_ecommerce/presentation/widgets/nibbles_info_body.dart';
import 'package:nibbles_ecommerce/presentation/widgets/tickers.dart';

import '../../application/cubits/nibbles_info/nibbles_info_cubit.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    context.read<NibblesInfoCubit>().fetchPrivacyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<NibblesInfoCubit, NibblesInfoState>(
        builder: (context, state) {
          if (state is NibblesInfoLoaded) {
            return NibblesInfoBody(
                nibblesInfo: state.info, title: "Privacy Policy");
          } else {
            return const LoadingTicker(text: "Loading");
          }
        },
      ),
    );
  }
}
